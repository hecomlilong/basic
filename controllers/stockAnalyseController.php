<?php

namespace app\controllers;
use Yii;
use app\models\StockAnalyse;
use yii\web\Controller;

class StockAnalyseController extends Controller
{
    public function actionIndex()
    {
//        $histMQuery = new HistDataMQuery($histM);
//        ini_set("display_errors",'on');
//        error_reporting(E_ALL);
        $stockAnalyseModel = new StockAnalyse();
        $stocks = $stockAnalyseModel->getBasicStocks();
        $analyse = array();
        foreach ($stocks as $stock) {
            $analyse[$stock] = $this->analyseStock($stock);
            break;
        }
        var_dump($analyse);
        return;
    }

    public function analyseStock($code){
        $stockAna = new StockAnalyse();

        return $stockAna->strategy1($code);
    }
}
