<?php
/**
 * Created by PhpStorm.
 * User: bruce
 * Date: 16/7/18
 * Time: 09:35
 */

namespace app\models;

use Yii;
use yii\base\Model;
use yii\web\UploadedFile;
use app\models\mysqlAna;

class MysqlAnalyse extends Model
{
	public $newSql;
	public $oldSql;
	public $submit;

	public function rules()
	{
		return [
			[['newSql'], 'file', 'skipOnEmpty' => false, 'extensions' => 'sql'],
			[['oldSql'], 'file', 'skipOnEmpty' => false, 'extensions' => 'sql'],
		];
	}

	public function upload()
	{
		if ($this->validate()) {
			$this->newSql->saveAs('uploads/' . $this->newSql->baseName . '.' . $this->newSql->extension);
			$this->oldSql->saveAs('uploads/' . $this->oldSql->baseName . '.' . $this->oldSql->extension);
			return true;
		} else {
			return false;
		}
	}

	public function getTableList(){
		header("content-type:text/html;charset=utf8;");
		$src = file_get_contents("../oms4.sql");
		$target = file_get_contents("../oms4-local.sql");

		$ss = new mysqlAna();
		$ss->initTables($src);
		$tt = new mysqlAna();
		$tt->initTables($target);
		$differences = $this->analyseDiff($ss->getTables(),$tt->getTables());
		var_dump($differences);
		$result = array();
		$num = 0;
		foreach($differences as $key=>$difference){
			foreach($difference as $tableName=>$tableData){
				if($key == "newTables"){
					$sqlQuery = $this->mysqlGenerator($key,array("tableName"=>$tableName,"createSql"=>$tableData["createSql"]));
					if($sqlQuery!='') {
						$item = array();
						$num += 1;
						$item['number'] = $num;
						$item['type'] = $key;
						$item['name'] = $tableName;
						$item['status'] = "正常";
						$item['sqlQuery'] = $sqlQuery;
						$result[] = $item;
					}
				}elseif($key == "modifiedTables"){
					foreach($tableData as $modifiedKey=>$modifiedItem){
						if($modifiedKey=="modifiedFields"){
							foreach ($modifiedItem as $fieldName=>$item) {
								$sqlQuery = $this->mysqlGenerator($modifiedKey, array("tableName" => $tableName, $modifiedKey => $modifiedItem));
								if($sqlQuery!='') {
									$item = array();
									$num += 1;
									$item['number'] = $num;
									$item['type'] = $modifiedKey;
									$item['name'] = $tableName;
									$item['status'] = "正常";
									$item['sqlQuery'] = $sqlQuery;
									$result[] = $item;
								}
							}
						}else {
							$sqlQuery = $this->mysqlGenerator($modifiedKey, array("tableName" => $tableName, $modifiedKey => $modifiedItem));
							if($sqlQuery!='') {
								$item = array();
								$num += 1;
								$item['number'] = $num;
								$item['type'] = $modifiedKey;
								$item['name'] = $tableName;
								$item['status'] = "正常";
								$item['sqlQuery'] = $sqlQuery;
								$result[] = $item;
							}
						}
					}
				}
			}
		}
		return $result;
	}

	public function analyseDiff($source, $target){
		$newTables = array_diff_key($source, $target);
		$deletedTables = array_diff_key($target, $source);
		$result = array();
		$result["newTables"] = $newTables;
		$result["deletedTables"] = $deletedTables;
		$result["modifiedTables"] = array();

		//检测修改的表
		$sourceTables = array_intersect_key($source,$target);
		foreach ($sourceTables as $key=>$sourceTable) {
			//检测新增的字段
			$newFields = array_diff_key($sourceTable["tableFields"], $target[$key]["tableFields"]);
			if(count($newFields)>0){
				$result["modifiedTables"][$key] = array("newFields"=>$newFields);
			}
			//检测删除的字段
			$deletedFields = array_diff_key($target[$key]["tableFields"], $sourceTable["tableFields"]);
			if(count($deletedFields)>0) {
				if (isset($result["modifiedTables"][$key])) {
					$result["modifiedTables"][$key]["deletedFields"] = $deletedFields;
				} else {
					$result["modifiedTables"][$key] = array("deletedFields" => $deletedFields);
				}
			}
			//检测修改的字段
			$modifiedFields = $this->getModifiedItems($sourceTable["tableFields"], $target[$key]["tableFields"]);
			if(count($modifiedFields)>0){
				if (isset($result["modifiedTables"][$key])) {
					$result["modifiedTables"][$key]["modifiedFields"] = $modifiedFields;
				}else{
					$result["modifiedTables"][$key] = array("modifiedFields" => $modifiedFields);
				}
			}
			//检测新增的索引
			$newIndexes = array_diff_key($sourceTable["tableIndexes"], $target[$key]["tableIndexes"]);
			if(count($newIndexes)>0){
				if (isset($result["modifiedTables"][$key])) {
					$result["modifiedTables"][$key]["newIndexes"] = $newIndexes;
				}else{
					$result["modifiedTables"][$key] = array("newIndexes" => $newIndexes);
				}
			}

			//检测修改的索引
			$modifiedIndexes = $this->getModifiedItems($sourceTable["tableIndexes"], $target[$key]["tableIndexes"]);
			if(count($newIndexes)>0){
				if (isset($result["modifiedTables"][$key])) {
					$result["modifiedTables"][$key]["modifiedIndexes"] = $modifiedIndexes;
				}else{
					$result["modifiedTables"][$key] = array("modifiedIndexes" => $modifiedIndexes);
				}
			}

			//检测删除的索引
			$deletedIndexes = array_diff_key($target[$key]["tableIndexes"], $sourceTable["tableIndexes"]);
			if(count($newIndexes)>0){
				if (isset($result["modifiedTables"][$key])) {
					$result["modifiedTables"][$key]["deletedIndexes"] = $deletedIndexes;
				}else{
					$result["modifiedTables"][$key] = array("deletedIndexes" => $deletedIndexes);
				}
			}

			//检测新增的表属性
			$newTableProperties = array_diff_key($sourceTable["tableProperties"], $target[$key]["tableProperties"]);
			if(count($newTableProperties)>0){
				if (isset($result["modifiedTables"][$key])) {
					$result["modifiedTables"][$key]["newTableProperties"] = $newTableProperties;
				}else{
					$result["modifiedTables"][$key] = array("newTableProperties" => $newTableProperties);
				}
			}

			//检测删除的表属性
			$deletedTableProperties = array_diff_key($target[$key]["tableProperties"], $sourceTable["tableProperties"]);
			if(count($deletedTableProperties)>0){
				if (isset($result["modifiedTables"][$key])) {
					$result["modifiedTables"][$key]["deletedTableProperties"] = $deletedTableProperties;
				}else{
					$result["modifiedTables"][$key] = array("deletedTableProperties" => $deletedTableProperties);
				}
			}

			//检测修改的表属性
			$modifiedTableProperties = $this->getModifiedItems($sourceTable["tableProperties"], $target[$key]["tableProperties"]);
			if(count($modifiedTableProperties)>0){
				if (isset($result["modifiedTables"][$key])) {
					$result["modifiedTables"][$key]["modifiedTableProperties"] = $modifiedTableProperties;
				}else{
					$result["modifiedTables"][$key] = array("modifiedTableProperties" => $modifiedTableProperties);
				}
			}
		}
		return $result;
	}

	public function getModifiedItems($source,$target){
		$result = array();

		$sourceFields = array_intersect_key($source,$target);
		foreach ($sourceFields as $key=>$sourceField) {
			if (is_array($sourceField)) {
				$newProperties = array_diff_key($sourceField, $target[$key]);
				if (count($newProperties) > 0) {
					$result[$key] = array("newProperties" => array("diff"=>$newProperties,"all"=>$sourceField));
				}

				$deletedProperties = array_diff_key($target[$key], $sourceField);

				if (count($deletedProperties) > 0) {
					if (isset($result[$key])) {
						$result[$key]["deletedProperties"] = array("diff"=>$deletedProperties,"all"=>$target[$key]);
					} else {
						$result[$key] = array("deletedProperties" => array("diff"=>$deletedProperties,"all"=>$target[$key]));
					}
				}


				$modifiedProperties = array();
				$intersectProperties = array_intersect_key($sourceField, $target[$key]);
				foreach ($intersectProperties as $innerKey => $intersectProperty) {
					if ($intersectProperty != $target[$key][$innerKey]) {
						$modifiedProperties[$innerKey] = $intersectProperty;
					}
				}
				if (count($modifiedProperties) > 0) {
					if (isset($result[$key])) {
						$result[$key]["modifiedProperties"] = array("diff"=>$modifiedProperties,"all"=>$sourceField);
					} else {
						$result[$key] = array("modifiedProperties" => array("diff"=>$modifiedProperties,"all"=>$sourceField));
					}
				}
			}else{
				if($sourceField!=$target[$key]){
					$result[$key] = $sourceField;
				}
			}
		}

		return $result;
	}

	public function getPropertyChangeSql($value){
		$res = '';
		if(isset($value['type'])&&$value['type']!=''){
			$res .= " ".strtoupper($value['type']);
		}
		if(isset($value['length'])&&$value['length']!=''){
			$res .= " (".strtotime($value['length']).")";
		}
		if(isset($value['UNSIGNED'])&&$value['UNSIGNED']){
			$res .= " UNSIGNED";
		}
		if(isset($value["NOT NULL"])&&$value["NOT NULL"]){
			$res .= " NOT NULL";
		}
		if(isset($value["DEFAULT"])&&$value["DEFAULT"]!=''){
			$res .= " DEFAULT {$value["DEFAULT"]}";
		}
		if(isset($value["COMMENT"])&&$value["COMMENT"]!=''){
			$res .= " COMMENT {$value["COMMENT"]}";
		}
		return $res;
	}

	public function getPropertySql($data,$type,$tableName){
		$result = '';
		if(isset($data['fieldName'])&&$data['fieldName']!=''){
			//ALTER TABLE `test` CHANGE `of` `of`
			// VARCHAR(11) UNSIGNED
			// CHARACTER SET utf8 COLLATE utf8_general_ci
			// NOT NULL DEFAULT '0' COMMENT 'ddd';

			$propertiesArr = $data[$type];
			if(count($propertiesArr)>0&&isset($propertiesArr['diff'])&&count($propertiesArr['diff'])>0){
				if(isset($propertiesArr['all'])&&is_array($propertiesArr['all'])) {
					$res = "ALTER TABLE `$tableName` CHANGE `{$data['fieldName']}` `{$data['fieldName']}`";

					$propSql = $this->getPropertyChangeSql($propertiesArr['all']);
					if($propSql!=''){
						$result .= $res.$propSql.";";
					}
				}
			}
		}
		return $result;
	}

	public function mysqlGenerator($type="newTables",$data=array()){
		$result = '';
		if(isset($data['tableName'])&&$data['tableName']!=''){
			$tableName = $data['tableName'];
		}else{
			return $result;
		}

		switch($type){
			case "newTables":
				$result = $data["createSql"];
				break;
			case "newIndexes":
//				alter table table_name add index index_name (column_list) ;
//				alter table table_name add unique (column_list) ;
//				alter table table_name add primary key (column_list) ;
				if(isset($data['newIndexes'])){
					$indexArr = $data['newIndexes'];
					if(count($indexArr)>0){
						foreach($indexArr as $indexName=>$value){
							if(isset($value['field'])) {
								$fields = implode(",", $value['field']);
								$indexType = isset($value['properties'])? $value['properties']:"INDEX";
								if($indexType=='PRIMARY'){
									$indexType .= " KEY";
								}
//								$result .= "CREATE $indexType $indexName ON `$tableName` ($fields);";
								$result .= "ALTER TABLE $tableName ADD $indexType $indexName ($fields);";
							}
						}
					}
				}
				break;
			case "newFields":
//				ALTER TABLE  `users` ADD  `token` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT  '返回给客户端token登入识别码',
//ADD  `token_time` DATETIME NULL DEFAULT NULL COMMENT  'token存入时间',
//ADD  `is_owner` TINYINT( 3 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  '是否是大区或城市或战区负责人，1代表是，其他情况以及其他职位统统为0',
//ADD  `hr_staff_id` INT( 11 ) NOT NULL DEFAULT  '0' COMMENT  'hr系统staff的id';
				if(isset($data['newFields'])){
					$fieldArr = $data['newFields'];
					if(count($fieldArr)>0){
//						ALTER TABLE `test` ADD `test`
// INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'dddd' AFTER `of`;
						foreach($fieldArr as $fieldName=>$value){
							$res = "ALTER TABLE `$tableName`";
							$res .= " ADD `$fieldName`";
							$propSql = $this->getPropertyChangeSql($value);
							if($propSql!=''){
								$result .= $res.$propSql.";";
							}
						}
					}
				}
				break;
			case "newProperties":
				$result = $this->getPropertySql($data,"newProperties",$tableName);
				break;
			case "deletedTables":
				$result = "DROP TABLE `$tableName`;";
				break;
			case "deletedIndexes":
//				drop index index_name on table_name ;
//				alter table table_name drop index index_name ;
//				alter table table_name drop primary key ;
				if(isset($data['deletedIndexes'])){
					$indexArr = $data['deletedIndexes'];
					if(count($indexArr)>0){
						foreach($indexArr as $indexName=>$value){
							$indexType = isset($value['properties'])? $value['properties']:"INDEX";
							if($indexType=='PRIMARY'){
								$indexType .= " KEY";
							}
							$result .= "ALTER TABLE $tableName DROP $indexType $indexName;";
						}
					}
				}
				break;
			case "deletedFields":
				if(isset($data['deletedFields'])&&is_array($data['deletedFields'])){
					if(count($data['deletedFields'])>0){
						foreach ($data['deletedFields'] as $fieldName=>$deletedField) {
							$result .= "ALTER TABLE $tableName DROP COLUMN $fieldName;";
						}
					}
				}
				break;
			case "deletedProperties":
				$result = $this->getPropertySql($data,"deletedProperties",$tableName);
				break;
			case "modifiedTables":
				break;
			case "modifiedFields":
				break;
			case "modifiedIndexes":
//				alter table table_name add index index_name (column_list) ;
//				alter table table_name add unique (column_list) ;
//              alter table table_name add primary key (column_list) ;
				break;
			case "modifiedProperties":
				$result = $this->getPropertySql($data,"modifiedProperties",$tableName);
				break;
			case "modifiedTableProperties":
				//ALTER TABLE `test` COMMENT = 'ffff';
				$res = '';
				foreach ($data['modifiedTableProperties'] as $key=>$value) {
					if($key=="AUTO_INCREMENT"){
						continue;
					}
					$res .= " $key = $value";
				}
				if($res != '') {
					$result .= "ALTER TABLE `$tableName` $res;";
				}
				break;
			case "newTableProperties":
				$res = '';
				foreach ($data['newTableProperties'] as $key=>$value) {
					if($key=="AUTO_INCREMENT"){
						continue;
					}
					$res .= " $key = $value";
				}
				if($res != '') {
					$result .= "ALTER TABLE `$tableName` $res;";
				}
				break;
			case "deletedTableProperties":
				break;
			default:
				break;
		}

		return $result;
	}
}