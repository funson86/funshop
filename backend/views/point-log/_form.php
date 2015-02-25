<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\PointLog */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="point-log-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'type')->dropDownList(\common\models\PointLog::getTypeLabels()) ?>

    <?= $form->field($model, 'point')->textInput() ?>

    <?= $form->field($model, 'remark')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'balance')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
