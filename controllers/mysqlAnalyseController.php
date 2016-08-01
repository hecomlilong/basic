<?php

namespace app\controllers;
use app\models\SqlData;
use Yii;
use app\models\MysqlAnalyse;
use yii\web\Controller;
use yii\web\UploadedFile;
use yii\data\Pagination;

class MysqlanalyseController extends Controller
{
    public function actionIndex()
    {
        Yii::setAlias('@sql_data_dir', '@app/upload/sql/');

        $model = new SqlData();
        $modelCanSave = false;
        $tableList = '';
        $fileNames = '';

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->oldSql = UploadedFile::getInstance($model,'oldSql');
            $model->newSql = UploadedFile::getInstance($model,'newSql');
            if ($model->oldSql)
            {
                $model->oldSql->saveAs(Yii::getAlias('@sql_data_dir') . $model->oldSql);
            }
            if ($model->newSql)
            {
                $model->newSql->saveAs(Yii::getAlias('@sql_data_dir') . $model->newSql);
            }
            if ($model->oldSql&&$model->newSql) {
                $modelCanSave = true;
            }
        }
        if($modelCanSave) {
            $modelAnalyse = new MysqlAnalyse(
                array(
                    "oldSql"=>Yii::getAlias('@sql_data_dir') . $model->oldSql,
                    "newSql"=>Yii::getAlias('@sql_data_dir') . $model->newSql
                )
            );

            $tableList = $modelAnalyse->getTableList();
            $fileNames = $modelAnalyse->getSqlFileNames();
        }
        return $this->render('index', ["tableList" => $tableList,"fileName"=>$fileNames,"model"=>$model,"modelCanSave"=>$modelCanSave]);
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
