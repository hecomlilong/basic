<?php
namespace app\models;
use Yii;
use yii\base\Model;
class SqlData extends Model {

	public $oldSql;
	public $newSql;

	public function attributeLabels() {
		return [
			'oldSql' => '旧数据',
			'newSql' => '新数据',
		]; }
	/**
	 * @return array the validation rules.
	 */
	public function rules() {
		return [
			['oldSql', 'file'],
			['newSql', 'file']
		];
	}
}