<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
//use backend\widgets\image\ImageDropzone;

/* @var $this yii\web\View */
/* @var $model common\models\Goods */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="goods-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'category_id')->textInput() ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'sku')->textInput(['maxlength' => 64]) ?>

    <?= $form->field($model, 'stock')->textInput() ?>

    <?= $form->field($model, 'weight')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'market_price')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'brief')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'origin')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'keywords')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'is_gift')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?php if (!$model->isNewRecord) { ?>
        <div class="form-group">
            <?php
            foreach ($model->goodsImages as $image) {
                $file = Yii::getAlias('@frontend/web' . $image->thumb_src);
                $fileType = \yii\helpers\FileHelper::getMimeType($file);
                $data = base64_encode(file_get_contents($file));
                echo '<div style="width:150px; float: left; text-align: center">';
                echo '<a href="'. \Yii::$app->getUrlManager()->createUrl(['goods/remove', 'id' => $image->id]) .'" title="' . Yii::t('app', 'Delete') . '" data-confirm="' . Yii::t('app', 'Are you sure you want to delete this item?') . '" data-method="post" data-pjax="0"><span class="glyphicon glyphicon-trash"></span></a> ';
                echo '<br>' . "<img src='data:" . $fileType .";base64," . $data . "' width=100>";
                echo '</div>';
            } ?>
            <div style="clear:both"></div>
        </div>

        <div class="form-group">
            <?= \backend\widgets\image\ImageDropzone::widget([
                'name' => 'file',
                'url' => ['upload'],
                'sortable' => true,
                'sortableOptions' => [
                    //'items' => '.dz-image-preview',
                ],
                //'model' => $model,
                //'attribute' => 'image',
                'htmlOptions' => [
                    //'class' => 'table table-striped files',
                    //'id' => 'previews',
                ],
                'options' => [
                    //'clickable' => ".fileinput-button",
                    'params' => ['goodsId' => $model->id,],
                ],
            ]); ?>
        </div>

    <?php } ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php $this->registerJs('
function removeImage() {
    alert("ok");
}
') ?>