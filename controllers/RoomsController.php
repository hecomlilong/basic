<?php
namespace app\controllers;
use Yii;
use yii\web\Controller;
use app\models\Room;

use yii\web\UploadedFile;
class RoomsController extends Controller {
	public function actionCreate() {
		$model = new Room();
		$modelCanSave = false;
		if ($model->load(Yii::$app->request->post()) && $model->validate()) {
			$model->fileImage = UploadedFile::getInstance($model,'fileImage');
			if ($model->fileImage)
			{
				$model->fileImage->saveAs('../upload/' . $model->fileImage);
			}
			$modelCanSave = true;
		}

		return $this->render('create',
			[ 'model' => $model,
				'modelSaved' => $modelCanSave
		]);
	}
}