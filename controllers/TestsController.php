<?php

namespace app\controllers;

use app\models\DailyKLine;
use Yii;
use yii\base\ErrorException;
use yii\base\Exception;
use app\models\FileAnalyse;
use app\models\QueryStockData;
use app\models\StockInfo;
use app\models\DailyTransaction;
use common\helpers\DateHelper;
use yii\helpers\ArrayHelper;
use PythonBase;

class TestsController extends \yii\web\Controller
{
    public function actionIndex()
    {
        PythonBase::get_hist_data("000607");
//        PythonBase::yell();
//        phpinfo();
        exit;
        var_dump($this->checkRecord("000001","2016-08-12"));exit;
        $filePath = "../yii-basic-app-2.0.9.tgz";
        $fileAnalyse = new FileAnalyse(array("sourceFile"=>$filePath));
        $allFilePath = $fileAnalyse->getFilePath();
//        var_dump($allFilePath);
        $test = $fileAnalyse->getTest();
        return $this->render('index',array("test"=>$test));
    }

    public function actionTest(){
        var_dump(ini_get("set_time_limit"));
        var_dump(ini_get("output_buffering"));
        exit;
        $sc = new QueryStockData();
        $startDate = date("Y-m-d");
//        $startDate = "2009-11-30";
        $endDate = "2005-01-01";

        $stockInfo = (ArrayHelper::getColumn(StockInfo::find()->select('code')->asArray()->all(),'code'));
        foreach ($stockInfo as $stockCode) {
            for($iterD=0;$iterD<=5000;$iterD++){
                $currentDate = date("Y-m-d",strtotime($startDate." -$iterD days"));
                $res = $this->saveHistoryStock($stockCode,$currentDate);
                echo $stockCode." ".$currentDate." "."res=$res\n";
                if($res===false || $currentDate < $endDate){
                    echo "break happened.\n";
                    break;
                }
            }
        }
    }

    public function checkRecord($stockCode,$date){
        return DailyKLine::find()
            ->where(["stock_code"=>$stockCode,"stock_date"=>$date])
            ->exists();
    }

    public function saveHistoryStock($stockCode,$date){
        $result = 0;
        if($this->checkRecord($stockCode,$date))
        {
            echo "checkRecord happened.\n";
            return 0;
        }
        if(in_array(date('w',strtotime($date)),array(0,6))){
            echo "weekend happened.\n";
            return 0;
        }
        $newQuery = new QueryStockData();
        $dailyKLine = new DailyKLine();
        $midData = $newQuery->getHistoryData($stockCode,$date);
        $data = $newQuery->prepareHistoryData($midData,$stockCode,$date);
        if(strpos($midData,"<script")!==false){
            echo $midData.'\n';
        }
        if(is_array($data)&&count($data)>0) {
            $top = 0.00;
            $bottom = floatval(end($data)['turnover_price']);
            $open = floatval(end($data)['turnover_price']);
            $close = floatval($data[0]['turnover_price']);
            $volume = 0;
            $total = 0;
            foreach ($data as $item) {
                if(floatval($item['turnover_price'])>$top){
                    $top = floatval($item['turnover_price']);
                }
                if(floatval($item['turnover_price'])<$bottom){
                    $bottom = floatval($item['turnover_price']);
                }
                $volume += $item['turnover_volume'];
                $total += $item['turnover_value'];
            }
            $dailyKLine->isNewRecord = true;
            $dailyKLine->stock_code = $stockCode;
            $dailyKLine->stock_date = $date;
            $dailyKLine->stock_top_price = $top;
            $dailyKLine->stock_bottom_price = $bottom;
            $dailyKLine->stock_open_price = $open;
            $dailyKLine->stock_close_price = $close;
            $dailyKLine->stock_volume = $volume;
            $dailyKLine->stock_turnover = $total;
            $result = $dailyKLine->save();
            $dailyKLine->id = 0;
            return $result!==false;
        }
        return $result;
    }

    public function saveStock($scCode){
        if(!$this->checkStockRecord($scCode)) {
            $stockInfo = new StockInfo();
            $newQuery = new QueryStockData();
            $midData = $newQuery->getStockData($scCode);
            $data = $newQuery->prepareStockData($midData);
            if(array_key_exists("stockName",$data)){
                $stockInfo->isNewRecord = true;
                $stockInfo->code = $scCode;
                $stockInfo->name = $data["stockName"];
                $stockInfo->save();
                $stockInfo->id=0;
                echo $scCode."saved.<br>";
                return;
            }
        }
        echo $scCode."skipped.<br>";
    }

    public function checkStockRecord($stockCode){
        return StockInfo::find()
            ->where(["code"=>$stockCode])
            ->exists();
    }

    public function queryStockInfo(){
        $sc = new QueryStockData();
        foreach ($sc->getSCPrefix() as $item) {
            for($iter=0;$iter<=999;$iter++) {
                $stockCode = $item.str_pad($iter,3,"0",STR_PAD_LEFT);
//                for($iterD=0;$iterD<=5000;$itemD++){
//                    $currentDate = date("Y-m-d",strtotime($startDate." -$itemD days"));
//                }
                $this->saveStock($stockCode);
            }
        }
    }
}
