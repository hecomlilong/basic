<?php
/**
 * Created by PhpStorm.
 * User: bruce
 * Date: 16/8/4
 * Time: 09:59
 */

namespace app\models;
use Yii;
use yii\base\Model;

class FileAnalyse extends Model
{
	public $filePath = array("php"=>array(),"other"=>array());
	public $sourceFile;
	public $structurePhp = array();
	public function __construct(array $config)
	{
		if(array_key_exists("sourceFile",$config)){
			$this->sourceFile = $config["sourceFile"];
			$this->extractFile($this->sourceFile);
		}
		parent::__construct($config);
	}
	public function extractFile($filePath){
		try {
			$p = new \PharData($filePath);
			$path = $p->getPath();
			$dir = substr($path,0,strrpos($path,"."));
			if(!file_exists($dir)) {
				$p->extractTo($dir, null, true);
			}
//			var_dump($dir);
			$files = $this->getAllFiles($dir);
			$this->setFilePath($files);
//			var_dump($files);
//			exit;

		}catch( ErrorException $e){
			echo $e->getMessage();
		}
	}

	public function setFilePath($pathArray){
		if(is_array($pathArray)){
			foreach ($pathArray as $item) {
				$extension = pathinfo($item, PATHINFO_EXTENSION);
				if(strtolower($extension)=="php"){
					$this->filePath["php"][]= $item;
				}else{
					$this->filePath["other"][]= $item;
				}
			}
		}
	}
	public function getFilePath($type="all"){
		if($type=="all"){
			return $this->filePath;
		}else{
			if(array_key_exists($type,$this->filePath)){
				return $this->filePath[$type];
			}else{
				return array();
			}
		}
	}

	public static function deleteDir($dirPath) {
		if (! is_dir($dirPath)) {
			throw new \InvalidArgumentException("$dirPath must be a directory");
		}
		if (substr($dirPath, strlen($dirPath) - 1, 1) != '/') {
			$dirPath .= '/';
		}
		$files = glob($dirPath . '*', GLOB_MARK);
		foreach ($files as $file) {
			if (is_dir($file)) {
				self::deleteDir($file);
			} else {
				unlink($file);
			}
		}
		rmdir($dirPath);
	}
	public function getAllFiles($dir){
		$result = array();
		if(is_dir($dir)){
			$items = array_diff(scandir($dir),array(".",".."));
			foreach($items as $item){
				$tmpPath = $dir."/".$item;
				if(is_dir($tmpPath)){
					$result = array_merge($result,$this->getAllFiles($tmpPath));
				}else{
					$result [] = $tmpPath;
				}
			}
		}else{
			$result [] = $dir;
		}
		return $result;
	}

	public function initStructure(){
		if(count($this->filePath["php"])>0){
			foreach ($this->filePath["php"] as $item) {

			}
		}
		return false;
	}

	public function extractContents($srcPath){
		$key = '';
		$properties = array();
		if($srcPath != ''&&file_exists($srcPath)){
			$src = file_get_contents($srcPath);
		}
		return array($key,$properties);
	}

	public function getNamespaces(){

	}

	public function getComments(){

	}

	public function structurePhp(){

	}

	public function getTest(){
		$test = "John ";
		$test[10] = "Dot";
		$result['str'] = $test;
		$result['len'] = strlen($test);
		return $result;
	}
}