<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\CouponType */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="coupon-type-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 64]) ?>

    <?= $form->field($model, 'money')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'min_amount')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'type')->dropDownList(\common\models\CouponType::labels()) ?>

    <?= $form->field($model, 'min_goods_amount')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'started_at')->textInput() ?>

    <?= $form->field($model, 'ended_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
