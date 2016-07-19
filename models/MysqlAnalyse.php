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
		var_dump($this->analyseDiff($ss->getTables(),$tt->getTables()));
		return array();
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
					$result[$key] = array("newProperties" => $newProperties);
				}

				$deletedProperties = array_diff_key($target[$key], $sourceField);

				if (count($deletedProperties) > 0) {
					if (isset($result[$key])) {
						$result[$key]["deletedProperties"] = $deletedProperties;
					} else {
						$result[$key] = array("deletedProperties" => $deletedProperties);
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
						$result[$key]["modifiedProperties"] = $modifiedProperties;
					} else {
						$result[$key] = array("modifiedProperties" => $modifiedProperties);
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
}