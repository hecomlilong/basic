<?php
namespace app\models;

use yii\base\Model;
use app\models\HistDataM;
use app\models\HistDataD;
use app\models\HistDataW;
use app\models\StockBasics;
/**
 * Created by PhpStorm.
 * User: bruce
 * Date: 16/7/14
 * Time: 11:37
 */
class StockAnalyse extends Model
{
	public static $strategies = array(
		"strategy1"=>array(
			"thresh"=>array(0.01),
		),
		"isGoingUp"=>array(
			"thresh"=>array(2,2,0),
		),
		"isGoingDown"=>array(
			"thresh"=>array(2,2,0),
		),
	);
	public function getBasicStocks(){
		return array_column(StockBasics::findBySql("select code from `stock_basics`")->asArray()->all(),"code");
	}

	public function strategy1($code){
		$result = array("buy"=>0,"sell"=>0,"hold"=>0);
		$histM = new HistDataM();
		$histW = new HistDataW();
		$histD = new HistDataD();
		$dayInfo = $histD->find()->where(["code"=>$code])->asArray()->all();
		$weekInfo = $histW->find()->where(["code"=>$code])->asArray()->all();
		$monthInfo = $histM->find()->where(["code"=>$code])->asArray()->all();
		$flag = false;
		foreach ($dayInfo as $dayVal) {
			foreach ($monthInfo as $monthVal) {
				if($this->isSamePeriod($dayVal['date'],"m",$monthVal['date'],"m")){
					if($this->matchIn($dayVal,"close",$monthVal,"ma20",self::$strategies[__FUNCTION__]["thresh"][0])){
						$result [] = $dayVal;
						$flag = true;
					}
				}elseif($flag){
					break;
				}
			}
		}
		return $result;
	}

	public function isSamePeriod($dateA,$typeA,$dateB,$typeB){
		$resultA = date($typeA,strtotime($dateA));
		$resultB = date($typeB,strtotime($dateB));
		return $resultA == $resultB;
	}

	public function matchIn($rowA,$typeA,$rowB,$typeB,$threshold){
		$result = false;
		if(isset($rowA)&&array_key_exists($typeA,$rowA)
		&&isset($rowB)&&array_key_exists($typeB,$rowB)){
			$result = ((floatval(abs($rowA[$typeA]-$rowB[$typeB]))/floatval($rowA[$typeA]))<=$threshold);
		}
		if($result){
			var_dump($rowA[$typeA]);
			var_dump($rowB[$typeB]);
			var_dump($threshold);
		}
		return $result;
	}

	public function isGoingUp($stockInfo,$date,$type){
		$result = false;
		$left = self::$strategies[__FUNCTION__]['thresh'][0];
		$right = self::$strategies[__FUNCTION__]['thresh'][1];
		$threshold = self::$strategies[__FUNCTION__]['thresh'][2];

		$dates = array_column($stockInfo,"date");

		$keyCenter = array_search($date,$dates);
		if($keyCenter!==false){
			$stocks = array();
			$i = 0;
			while($i <= $left){
				$key = $keyCenter - $left + $i;
				if(array_key_exists($key,$stockInfo)){
					$stocks [] = $stockInfo[$key];
				}
				$i += 1;
			}
			$i = 1;
			while($i <= $right){
				$key = $keyCenter + $i;
				if(array_key_exists($key,$stockInfo)){
					$stocks [] = $stockInfo[$key];
				}
				$i += 1;
			}
			foreach ($stocks as $key=>$stock) {
				if(array_key_exists($key-1,$stocks)){
					if(!$this->matchIn($stocks[$key-1],$type,$stocks[$key],$type,$threshold)){
						$result = false;
						break;
					}else{
						$result = true;
					}
				}
			}
		}
		return $result;
	}

	public function isGoingDown($stockInfo,$date,$type){
		$result = false;
		$left = self::$strategies[__FUNCTION__]['thresh'][0];
		$right = self::$strategies[__FUNCTION__]['thresh'][1];
		$threshold = self::$strategies[__FUNCTION__]['thresh'][2];

		$dates = array_column($stockInfo,"date");

		$keyCenter = array_search($date,$dates);
		if($keyCenter!==false){
			$stocks = array();
			$i = 0;
			while($i <= $left){
				$key = $keyCenter - $left + $i;
				if(array_key_exists($key,$stockInfo)){
					$stocks [] = $stockInfo[$key];
				}
				$i += 1;
			}
			$i = 1;
			while($i <= $right){
				$key = $keyCenter + $i;
				if(array_key_exists($key,$stockInfo)){
					$stocks [] = $stockInfo[$key];
				}
				$i += 1;
			}
			foreach ($stocks as $key=>$stock) {
				if(array_key_exists($key-1,$stocks)){
					if(!$this->matchIn($stocks[$key],$type,$stocks[$key-1],$type,$threshold)){
						$result = false;
						break;
					}else{
						$result = true;
					}
				}
			}
		}
		return $result;
	}
}