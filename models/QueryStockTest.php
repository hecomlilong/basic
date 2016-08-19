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

// 腾讯股票数据接口: http://qt.gtimg.cn/q=
// 新浪股票数据接口: http://hq.sinajs.cn/list=
// 采用腾讯的数据接口会显示市值信息，采用新浪的接口不显示市值
class QueryStockTest extends Model{
	const sinaAPI = "http://qt.gtimg.cn/q=";
	const tecentAPI = "http://hq.sinajs.cn/list=";
	const historyAPI = "http://market.finance.sina.com.cn/downxls.php";

	public $market=array(
		'000' => 'sz',
		'001' => 'sz',
		'002' => 'sz',
		'200' => 'sz',   // 深圳B股
		'300' => 'sz',
		'600' => 'sh',
		'601' => 'sh',
		'603' => 'sh',
		'900' => 'sh',   // 上海B股
	);

	public $propertyMap = array(
		"买盘"=>1,
		"卖盘"=>2,
		"中性盘"=>0,
	);

	public $turnoverMap = array(
		"turnover_time"=>0,
		"turnover_price"=>1,
		"turnover_volume"=>3,
		"turnover_value"=>4,
		"property"=>5);

	public function getQueryData($stockCode,$date){

		$key = substr($stockCode,0,3);
		if(array_key_exists($key,$this->market)){
			$symbol = $this->market[$key].$stockCode;
		}

		if(isset($symbol)) {
			return $this->curl_query(self::historyAPI . "?date=$date&symbol=$symbol");
		}else{
			return "";
		}
	}

	public function prepareData($s,$stockCode,$date){
		$result = array();
		if(is_string($s)){
			$rows = explode("\n",$s);
			foreach ($rows as $k=>$row) {
				$rowItems = explode("\t",$row);
				if(count($rowItems)==6&&$k!=0) {
					$item = array();
					foreach ($this->turnoverMap as $key => $value) {
						$item[$key] = $rowItems[$value];
					}
					$item['turnover_time'] = $date." ".$item['turnover_time'];
					$item['stock_code'] = $stockCode;
//					var_dump($item['property']);
					var_dump($this->propertyMap);exit;
					var_dump(array_key_exists($item['property'],$this->propertyMap));echo $item['property']."<br>";
					$item['property'] = strval(array_key_exists($item['property'],$this->propertyMap)?$this->propertyMap[$item['property']]:$this->propertyMap["中性盘"]);
					$result [] = $item;
					if($k==100){
						break;
					}
				}
			}
		}
		return $result;
	}

	private function curl_query($url,$timeout=30){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POST, 0);
		curl_setopt($ch, CURLOPT_HEADER, 0 );
		curl_setopt($ch, CURLOPT_HTTPHEADER,  array('Content-type: application/json'));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT,$timeout);
		curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
		$output = curl_exec($ch);
		if (curl_errno ( $ch )) {
			echo 'Errno' . curl_error ( $ch );
		}
		curl_close($ch);
		return $output;
	}
}