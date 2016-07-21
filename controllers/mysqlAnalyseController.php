<?php

namespace app\controllers;
use Yii;
use app\models\MysqlAnalyse;
use yii\web\Controller;
use yii\web\UploadedFile;
use yii\data\Pagination;

class MysqlanalyseController extends Controller
{
    public function actionIndex()
    {
        $model = new MysqlAnalyse();
//        if ($model->load(Yii::$app->request->post())&&$model->validate()) {
//
//            var_dump($model->newSql);exit;
//            return $this->render('index', ["tableList" => $tableList,"model"=>$model,"test"=>123]);
//        }else{
//            return $this->render("index",["model"=>$model,"test"=>222]);
//        }
        $tableList = $model->getTableList();
        return $this->render('index', ["tableList" => $tableList,"model"=>$model]);
    }
    public function actionUpload()
    {
        $model = new MysqlAnalyse();

        if (Yii::$app->request->isPost) {
            $model->newSql = UploadedFile::getInstance($model, 'newSql');
            $model->oldSql = UploadedFile::getInstance($model, 'oldSql');
            if ($model->upload()) {
                // file is uploaded successfully
                return;
            }
        }

        return $this->render('index', ['model' => $model]);
    }
}
