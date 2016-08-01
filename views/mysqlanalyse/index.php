<?php
/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = '数据库差异检测工具';
$this->params['breadcrumbs'][] = ['label' => '检测工具', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
if(isset($test)&&$test!=''){
    echo $test;
}
?>
<div class="container">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
    <div class="row">
        <div class="col-lg-12">
            <h1>数据库差异检测工具</h1>

            <?= $form->field($model, 'oldSql')->fileInput() ?>
            <?= $form->field($model, 'newSql')->fileInput() ?>
        </div>
    </div>
    <div class="form-group">
        <?= Html::submitButton('提交' , ['class' => 'btn btn-success']) ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
<?php
if(isset($tableList)&&!empty($tableList)){
?>
<div id="container" class="container">
    <div><p>新数据:<?php echo $fileName['new'];?>,旧数据:<?php echo $fileName['old'];?></p></div>


        <div style="margin-top: 10px;">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-copyright-mark"></span> 数据库对比结果
                </div>

                <table class="table table-bordered table-hover" style="font-size: 12px;">
                    <thead><tr>
                        <th></th>
                        <th>
                            序号
                        </th>
                        <th>
                            类别
                        </th>
                        <th>
                            表名
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            sql语句预览
                        </th>
<!--                        <th>-->
<!--                            操作-->
<!--                        </th>-->
                        <th>
                            备注
                        </th>
                    </tr></thead>
                    <tbody>

                    <?php if(is_array($tableList)){ foreach ($tableList as $v) { ?>
                    <tr>
                        <td >
                            <input type="checkbox" value="<?php echo $v['number']?>" name="<?php echo $v['number']?>" id="<?php echo $v['number']?>" /> &nbsp;&nbsp;
                            <button type="button" class="btn btn-danger btn-xs" value="生成脚本!" onClick="createSql('<?php echo $v['number']?>')">
                                <span class="glyphicon glyphicon-fire"></span> 生成脚本!
                            </button>
                        </td>
                        <td><?php echo $v['number'];?></td>
                        <td><?php echo $v['type']?></td>
                        <td><?php echo $v['name']?></td>
                        <td><?php echo $v['status']?></td>
                        <td id="sql<?php echo $v['number'];?>"><?php echo $v['sqlQuery']?></td>
<!--                        <td><a data-target="#detailModal" data-toggle="modal" href="#" class='btn btn-xs btn-primary'><span class='glyphicon glyphicon-book'></span>执行</a></td>-->
                        <td><?php echo $v['note']?></td>
                        <?php }}?>
                    </tr>
<!--                    <tr>-->
<!--                        <td  style="text-align:right" colspan='6'>--><?php //echo $pager;?><!--</td>-->
<!--                    </tr>-->
                    <tr>
                        <td>
                            <input type="checkbox" value="全选" name="selectAll" id="0" onclick="check(this)" />
                            <button type="button" class="btn btn-danger btn-sm" value="生成脚本" onClick="createSql(0)">
                                <span class="glyphicon glyphicon-fire"></span> 生成脚本
                                <!--<span class="glyphicon glyphicon-fire"></span> 扔到开放池!-->
                            </button>
                        </td>
                        <td  colspan='5' style="text-align: left" id="summaryResult">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>

</div>
    <?php
}
?>
<script type="text/javascript">
    function createSql(number){
        if(number==0){
            var allCheck = document.getElementsByTagName("input");
            var summaryStr="";
            for(var i = 0; i < allCheck.length; i++){
                if( allCheck[i].type=="checkbox"){
                    if( allCheck[i].checked && allCheck[i].id > 0){
                        summaryStr += $("#sql"+allCheck[i].id).text()+"<br>";
                    }
                }
            }
            $("#summaryResult").html(summaryStr);
        }else{
            $("#summaryResult").html($("#sql"+number).text());
        }
    }
    function check(obj) //全选
    {
        var allCheck = document.getElementsByTagName("input");
        if (obj.checked) {
            for (var i = 0; i < allCheck.length; i++) {
                if (allCheck[i].type == "checkbox") {
                    if (allCheck[i].id > 0) {
                        allCheck[i].checked=true;
                    }
                }
            }
        }else{
            for (var i = 0; i < allCheck.length; i++) {
                if (allCheck[i].type == "checkbox") {
                    if (allCheck[i].id > 0) {
                        allCheck[i].checked=false;
                    }
                }
            }
        }
    }
</script>