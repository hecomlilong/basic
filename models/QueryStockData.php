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
class QueryStockData extends Model{
	const tecentAPI = "http://qt.gtimg.cn/q=";
	const sinaAPI = "http://hq.sinajs.cn/list=";
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

	public $scPrefix = array(
		"600",
		"601",
		"603",
		"000",
		"001",
		"002",
		"300",);

	public $propertyMap = array(
		"买盘"=>1,
		"卖盘"=>2,
		"中性盘"=>0,
	);

	public $turnoverMap = array(
		"turnover_time"=>0,
		"turnover_price"=>1,
		"turnover_value"=>4,
		"turnover_volume"=>3,
		"property"=>5);

	public function getHistoryData($stockCode,$date){
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

	public function getHistoryDataParallel($stockCode,$date){
		$key = substr($stockCode,0,3);
		if(array_key_exists($key,$this->market)){
			$symbol = $this->market[$key].$stockCode;
		}

		if(isset($symbol)) {
			if(is_array($date)){
				$urls = array();
				foreach ($date as $item) {
					$urls [] = self::historyAPI . "?date=$item&symbol=$symbol";
				}
			}
			return $this->curl_query(self::historyAPI . "?date=$date&symbol=$symbol");
		}else{
			return "";
		}
	}

	public function prepareHistoryData($s,$stockCode,$date){
		$result = array();
		if(is_string($s)&&strpos($s,"window.close();")===false){
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
//					header("content-type:text/html;charset=utf8;");
					$item['property'] = iconv('GB2312', 'UTF-8', $item['property']);
					$result [] = $item;
				}
			}
		}
		return $result;
	}

	private function curl_query($url,$timeout=15){
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

	public function getSCPrefix(){
		return $this->scPrefix;
	}

	public function getSCMarket($scPrefix){
		$result = '';
		if(array_key_exists($scPrefix,$this->market)){
			$result = $this->market[$scPrefix];
		}
		return $result;
	}

	public function getStockData($stockCode){
		$key = substr($stockCode,0,3);
		if(array_key_exists($key,$this->market)){
			$symbol = $this->market[$key].$stockCode;
		}

		if(isset($symbol)) {
			return $this->curl_query(self::sinaAPI . $symbol);
		}else{
			return "";
		}
	}

	public function prepareStockData($s){
		$result = array();
		if(is_string($s)){
			$rows = explode("=",$s);
			if(array_key_exists(1,$rows)){
				$tmp = trim($rows[1],"\";");
				if($tmp==''){
					return $result;
				}
				$columns = explode(",",$tmp);
//				$result["stockName"] = iconv('CP936', 'UTF-8', $columns[0]);
				$result["stockName"] = $this->charsetReset($columns[0]);
				return $result;
			}
		}
		return $result;
	}

	public function charsetReset($data){
		if( !empty($data) ){
//			$fileType = mb_detect_encoding($data , array('UTF-8','GBK','LATIN1','BIG5')) ;
			$fileType = mb_detect_encoding($data , "ASCII,UTF-8,CP936,EUC-CN,BIG-5,EUC-TW") ;
			if( $fileType != 'UTF-8'){
//				$data = mb_convert_encoding($data ,'UTF-8//TRANSLIT' , $fileType);
				$data = iconv($fileType,"UTF-8//IGNORE",$data);
			}
//			$fileType = mb_detect_encoding($data , "ASCII,UTF-8,CP936,EUC-CN,BIG-5,EUC-TW") ;
//			var_dump($fileType);
//			var_dump($data);
		}
		return $data;
	}
}