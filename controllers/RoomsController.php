<?php
namespace app\controllers;
use Yii;
use yii\web\Controller;
use app\models\Room;
class RoomsController extends Controller {
	public function actionCreate() {
		$model = new Room();
		$modelCanSave = false;
		if ($model->load(Yii::$app->request->post()) && $model->validate()) {
			$modelCanSave = true;
		}

		return $this->render('create',
			[ 'model' => $model,
				'modelSaved' => $modelCanSave
		]);
	}
}