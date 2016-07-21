<?php
/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = '数据库差异检测工具';
$this->params['breadcrumbs'][] = ['label' => '检测工具', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
if(isset($test)){
    echo $test;
}
?>
<h1>数据库差异检测工具</h1>
<div class="container">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data','class' => 'form-horizontal']]) ?>
    <?= $form->field($model, 'newSql')->fileInput() ?>
    <?= $form->field($model, 'oldSql')->fileInput() ?>
    <div class="form-group">
        <div class="col-lg-offset-1 col-lg-11">
            <?= Html::submitButton('提交', ['class' => 'btn btn-primary', 'name' => 'submit-button']) ?>
        </div>
    </div>

    <?php ActiveForm::end() ?>
</div>

<div id="container" class="container">
        <?php
        if(!empty($tableList)){
        ?>

        <div style="margin-top: 10px;">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-copyright-mark"></span> 数据库对比结果
                </div>

                <table class="table table-bordered table-hover" style="font-size: 12px;">
                    <thead><tr>
                        <th>
                            序号
                        </th>
                        <th>
                            类别
                        </th>
                        <th>
                            名称
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            sql语句
                        </th>
                        <th>
                            操作
                        </th>
                    </tr></thead>
                    <tbody>

                    <?php if(is_array($tableList)){ foreach ($tableList as $v) { ?>
                    <tr>
                        <td><?php echo $v['number'];?></td>
                        <td><?php echo $v['type']?></td>
                        <td><?php echo $v['name']?></td>
                        <td><?php echo $v['status']?></td>
                        <td><?php echo $v['sqlQuery']?></td>
                        <td><a data-target="#detailModal" data-toggle="modal" href="#" class='btn btn-xs btn-primary'><span class='glyphicon glyphicon-book'></span>执行</a></td>
                        <?php }}?>
                    </tr>
<!--                    <tr>-->
<!--                        <td  style="text-align:right" colspan='6'>--><?php //echo $pager;?><!--</td>-->
<!--                    </tr>-->
                    </tbody>
                </table>

            </div>
        </div>
        <?php
    }
    ?>
</div>