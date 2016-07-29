<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use yii\helpers\ArrayHelper; ?>
<?php if($modelSaved) { ?>
	<div class="alert alert-success">
	Model ready to be saved! </div>
<?php } ?>
<?php $form = ActiveForm::begin(); ?>
	<div class="row">
		<div class="col-lg-12">
			<h1>Room form</h1>
			<?= $form->field($model, 'floor')->textInput() ?>
			<?= $form->field($model, 'room_number')->textInput() ?>
			<?= $form->field($model, 'has_conditioner')->checkbox() ?>
			<?= $form->field($model, 'has_tv')->checkbox() ?>
			<?= $form->field($model, 'has_phone')->checkbox() ?>
			<?= $form->field($model, 'available_from')->textInput() ?>
			<?= $form->field($model, 'price_per_day')->textInput() ?>
			<?= $form->field($model, 'description')->textarea() ?>
		</div>
	</div>
	<div class="form-group">
		<?= Html::submitButton('Create' , ['class' => 'btn btn-success']) ?>
	</div>
<?php ActiveForm::end(); ?>