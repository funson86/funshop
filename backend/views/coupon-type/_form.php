<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\CouponType */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="coupon-type-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-6\">{input}{hint}</div>\n<div class=\"col-lg-5\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-1 control-label'],
        ],
    ]); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 64]) ?>

    <?= $form->field($model, 'money')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'min_amount')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'type')->dropDownList(\common\models\CouponType::labels()) ?>

    <?= $form->field($model, 'min_goods_amount')->textInput(['maxlength' => 10]) ?>

    <div class="form-group field-car-started_at">
        <?= Html::activeLabel($model, 'started_at', ['class' => 'col-lg-1 control-label']); ?>
        <div class="col-lg-3">
            <?php
            echo \yii\jui\DatePicker::widget([
                'model' => $model,
                'attribute' => 'started_at',
                'dateFormat' => 'yyyy-MM-dd',
            ]);
            ?>
        </div>
        <?= Html::error($model, 'started_at', ['class' => 'col-lg-5']); ?>
    </div>

    <div class="form-group field-car-started_at">
        <?= Html::activeLabel($model, 'ended_at', ['class' => 'col-lg-1 control-label']); ?>
        <div class="col-lg-3">
            <?php
            echo \yii\jui\DatePicker::widget([
                'model' => $model,
                'attribute' => 'ended_at',
                'dateFormat' => 'yyyy-MM-dd',
            ]);
            ?>
        </div>
        <?= Html::error($model, 'ended_at', ['class' => 'col-lg-5']); ?>
    </div>

    <div class="form-group">
        <label class="col-lg-2 control-label" for="">&nbsp;</label>
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
