<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\GoodsImage */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="goods-image-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'goods_id')->textInput() ?>

    <?= $form->field($model, 'url')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'description')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'thumb_url')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'origin_url')->textInput(['maxlength' => 255]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
