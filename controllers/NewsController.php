<?php
// 1. specify namespace at the top (in basic application usually app\controllers);
namespace app\controllers;
// 2. specify 'use' path for used class;
use Yii;
use yii\web\Controller;
// 3. controller class must extend yii\web\Controller class; // This line is equivalent to
// class NewsController extends yii\web\Controller
class NewsController extends Controller
{
// 4. actions are handled from controller functions whose name starts with 'action' and the first letter of each word is uppercase;
	public function actionIndex() {
		echo "this is my first controller";
	}

	public function actionItemsList()
	{
		$newsList = $this->dataItems();
		return $this->render('itemsList',['newsList'=>$newsList]);
	}
	public function dataItems(){
		$newsList = [
			[ 'id'=>1,'title' => 'First World War', 'date' => '1914-07-28' ],
			[ 'id'=>2,'title' => 'Second World War', 'date' => '1939-09-01' ],
			[ 'id'=>3,'title' => 'First man on the moon', 'date' => '1969-07-20' ]
		];
		return $newsList;
	}

	public function actionItemDetail($id) {
		$newsList = $this->dataItems();
		$item = null;
		foreach($newsList as $n) {
			if($id == $n['id'])
				$item = $n;
		}
		return $this->render('itemDetail', ['item' => $item]);
	}

	public function actionAdvTest(){
		return $this->render("advTest");
	}

	public function actionResponsiveContentTest() {
		$responsive = Yii::$app->request->get('responsive', 0);
		if($responsive)
		{
			$this->layout = 'responsive';
		}
		else
		{
			$this->layout = 'main';
		}
		return $this->render('responsiveContentTest', ['responsive' => $responsive]);
	}
}
