<?php
namespace app\models;

use yii\base\Model;
/**
 * Created by PhpStorm.
 * User: bruce
 * Date: 16/7/14
 * Time: 11:37
 */
class mysqlAna extends Model
{
	private $tablesqls = array();
	private $tables = array();
	private $keys = array(
		"DEFAULT",
		"NOT",
		"COMMENT",
		"UNSIGNED",
		"AUTO_INCREMENT",
		"BINARY",
	);
	private $twoWordKeys = array(
		"NOT"=>"NULL",
		"UNSIGNED"=>"ZEROFILL",
	);
	private $multiWordKeys = array(
		"DEFAULT"=>array("CURRENT_TIMESTAMP","ON","UPDATE","CURRENT_TIMESTAMP"),
	);
	public function getTableStart($html){
		$needle = "CREATE";
		$lastPos = 0;
		$positions = array();

		while (($lastPos = strpos($html, $needle, $lastPos))!== false) {
			$positions[] = $lastPos;
			$lastPos = $lastPos + strlen($needle);
		}
		return $positions;
	}

	public function getTableEnd($html,$start){
		$needle = "ENGINE";
		$endPositions = array();
		if(is_array($start)) {
			foreach ($start as $item) {
				if(($linePos = strpos($html,$needle, $item))!==false){
					$pos = strpos($html,"\n",$linePos) - 1;
					$endPositions[] = $pos;
				}
			}
		}elseif($start >= 0){
			if(($pos = strpos($html,$needle, $start))!==false){
				$endPositions = $pos;
			}
		}
		return $endPositions;
	}

	public function getTableSql($html){
		$startPos = $this->getTableStart($html);
		$endPos = $this->getTableEnd($html,$startPos);

		if(count(array_diff_key($startPos,$endPos))>0){
			return $this->tablesqls;
		}

		foreach ($startPos as $key=>$startPo) {
			if($startPo >= $endPos[$key]){
				break;
			}else{
				$this->tablesqls[] = substr($html,$startPo,$endPos[$key]-$startPo+1);
			}
		}
		return $this->tablesqls;
	}
	public function initTables($html){
		$tablesql = $this->getTableSql($html);
		foreach ($tablesql as $item) {
			$tableName = $this->getTableName($item);
			if($tableName != '' && is_string($tableName)) {
				$this->tables[$tableName] =
					array(
						'createSql' => $item,
						'tableFields' => $this->getTableFields($item),
						'tableIndexes' => $this->getTableIndexes($item),
						'tableProperties' => $this->getTableProperties($item),
					);
			}
		}
	}
	public function getTables(){
		return $this->tables;
	}
	public function getTableName($subject,$caseSensitive=false){
		$pattern = '/(?<=\`)[^`]\w*(?=\`)/';
		preg_match($pattern, $subject, $matches, PREG_OFFSET_CAPTURE);
		if(count($matches)>0) {
			return $caseSensitive ? $matches[0][0]:strtolower($matches[0][0]);
		}else{
			return '';
		}
	}

	public function getTableFields($item){
		$result = array();
		$lines = explode("\n",$item);

		foreach ($lines as $line) {
			if(strpos($line,'CREATE TABLE')!==false){
				continue;
			}
			if(strpos($line,'KEY')!==false){
				continue;
			}
			if($line==end($lines)){
				continue;
			}
			$name = $this->getFieldNameFromLine($line);
			$properties = $this->getFieldPropertiesFromLine($line);
			if($name!=''){
				$result[$name]=$properties;
			}
		}
		return $result;
	}

	public function getTableIndexes($item){
		$result = array();
		$lines = explode("\n",$item);

		foreach ($lines as $line) {
			if(strpos($line,'KEY')!==false){
				$name = $this->getIndexNameFromLine($line);
				$field = $this->getIndexFieldNameFromLine($line);
				$properties = $this->getIndexPropertiesFromLine($line);
				if($name!=''){
					$result[$name]=array("field"=>$field,"properties"=>$properties);
				}
			}
		}
		return $result;
	}

	public function getTableProperties($item){
		$result = array();
		$lines = explode("\n",$item);
		$line = array_pop($lines);
		$line = trim($line,") ;");
		$properties = explode(" ",$line);
		$properties = $this->merge($properties,"COMMENT");
		foreach ($properties as $property) {
			$res = explode("=",$property);
			if(count($res)>1){
				$result[$res[0]] = $res[1];
			}
		}
		return $result;
	}

	public function getFieldNameFromLine($line){
		$poss = strpos($line,'`');
		$pose = strpos($line,'`',$poss+1);
		if($poss!==false&&$pose!==false) {
			return substr($line, $poss + 1, $pose - $poss - 1);
		}else{
			return '';
		}
	}

	//analyse each fields properties of a table
	public function getFieldPropertiesFromLine($line){
		$result = array();
		$poss = strpos($line,'`');
		$pose = strpos($line,'`',$poss+1);
		if($poss!==false&&$pose!==false) {
			$strBehind = trim(trim(substr($line, $pose + 1)), ",");
			$res = explode(" ", $strBehind);
			$res = $this->merge($res, "COMMENT");
			$res = $this->merge($res, "DEFAULT");
			$preKeyword = '';
			$multiKeyIterator = 0;
			$multiKeyPartiallyMatches = array();
			foreach($res as $key=>$value){
				$value = strtoupper($value);
				//第一个是字段类型和长度
				if($key==0){
					if(($bracketS=strpos($res[0],"("))!==false){
						$result['type'] = substr($res[0],0,$bracketS);
						$result['length'] = substr(trim($res[0],")"),$bracketS+1);
					}else{
						$result['type'] = $res[0];
						$result['length'] = '';
					}
					continue;
				}
				if(in_array($value,$this->keys)){
					if($preKeyword!=''){
						if(count($multiKeyPartiallyMatches)>0){
							$result[$preKeyword] = implode(" ",$multiKeyPartiallyMatches);
							$multiKeyPartiallyMatches = array();
						}else {
							$result[$preKeyword] = true;
						}
					}
					$preKeyword = $value;
					continue;
				}
				if(array_key_exists($preKeyword,$this->twoWordKeys)&&$this->twoWordKeys[$preKeyword]==$value){
					$result["$preKeyword $value"]=true;
					$preKeyword = '';
					continue;
				}

				if(array_key_exists($preKeyword,$this->multiWordKeys)&&in_array($value,$this->multiWordKeys[$preKeyword])){
					if($value == $this->multiWordKeys[$preKeyword][$multiKeyIterator]){
						$multiKeyIterator += 1;
						$multiKeyPartiallyMatches[]=$value;
					}
					if($multiKeyIterator==count($this->multiWordKeys[$preKeyword])){
						$result[$preKeyword] = implode(" ", $this->multiWordKeys[$preKeyword]);
						$multiKeyIterator = 0;
						$preKeyword = '';
						$multiKeyPartiallyMatches = array();
					}else {
						continue;
					}
				}

				if($preKeyword != ''){
					$result[$preKeyword] = $value;
					$preKeyword = '';
				}
			}
			if($preKeyword!=''){
				if(count($multiKeyPartiallyMatches)>0){
					$result[$preKeyword] = implode(" ",$multiKeyPartiallyMatches);
				}else {
					$result[$preKeyword] = true;
				}
			}
		}
		return $result;
	}

	public function getIndexNameFromLine($line){
		return $this->getFieldNameFromLine($line);
	}
	public function getIndexFieldNameFromLine($line){
		//deal with case of "PRIMARY KEY (`id`),"
		if(strpos($line,"PRIMARY")!==false){
			return $this->getFieldNameFromLine($line);
		}
		$poss = strpos($line,'(`');
		$pose = strpos($line,'`)',$poss+2);
		if($poss!==false&&$pose !== false) {
			$fieldString = substr($line, $poss + 2, $pose - $poss - 2);
			//deal with case of "KEY `userid` (`userid`,`token`)"
			return explode("`,`",$fieldString);
		}else{
			return array();
		}
	}

	public function getIndexPropertiesFromLine($line){
		$properties = explode(" ",trim($line));
		foreach($properties as $key=>$property){
			if($property == "KEY"){
				if($key==0) {
					return "INDEX";
				}
			}else{
				return $property;
			}
		}
		return '';
	}

	public function merge($wordsArr, $type){
		if(is_array($wordsArr)){
			$needToMerge = array();
			$typeStart = false;
			$mergedIndex = 0;
			$needToDelete = array();
			foreach ($wordsArr as $key=>$word) {
				if($typeStart){
					if(!in_array($word,$this->keys)){
						$needToMerge[] = $word;
						if($mergedIndex < $key) {
							$needToDelete[] = $key;
						}
					}else{
						break;
					}
				}
				if($word==$type){
					$typeStart = true;
					$mergedIndex = $key + 1;
				}
			}
			if(count($needToDelete) > 0){
				$wordsArr[$mergedIndex] = " ".implode(" ",$needToMerge);
				foreach ($needToDelete as $item) {
					unset($wordsArr[$item]);
				}
			}
		}else{
			return array();
		}
		return $wordsArr;
	}
}