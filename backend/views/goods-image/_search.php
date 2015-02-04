<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\GoodsImageSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="goods-image-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'goods_id') ?>

    <?= $form->field($model, 'url') ?>

    <?= $form->field($model, 'description') ?>

    <?= $form->field($model, 'thumb_url') ?>

    <?php // echo $form->field($model, 'origin_url') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
