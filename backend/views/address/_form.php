<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model common\models\Address */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="address-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-3\">{input}{hint}</div>\n<div class=\"col-lg-5\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-2 control-label'],
        ],
    ]); ?>

    <?php if ($model->isNewRecord) { ?>
        <?= $form->field($model, 'user_id')->textInput() ?>
    <?php } ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 64]) ?>

    <?= $form->field($model, 'consignee')->textInput(['maxlength' => 64]) ?>

    <?php
    $dataCountry = ArrayHelper::map(\common\models\Region::find()->asArray()->where(['parent_id' => 0])->all(), 'id', 'name');
    echo $form->field($model, 'country')->dropDownList($dataCountry,
        [
            'prompt'=> Yii::t('app','Please Select'),
            'onchange'=>'
                $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                  $( "select#address-province" ).html( data );
                });'
        ]);

    echo $form->field($model, 'province')->dropDownList(
        $model->city ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->country])->all(), 'id', 'name') : [],
        [
            'onchange'=>'
                $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                  $( "select#address-city" ).html( data );
                });'
        ]);

    echo $form->field($model, 'city')->dropDownList(
        $model->city ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->province])->all(), 'id', 'name') : [],
        [
            'onchange'=>'
                $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                  $( "select#address-district" ).html( data );
                });'
        ]);

    echo $form->field($model, 'district')->dropDownList($model->district ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->city])->all(), 'id', 'name') : []);
    ?>

    <?= $form->field($model, 'address')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'zipcode')->textInput(['maxlength' => 16]) ?>

    <?= $form->field($model, 'phone')->textInput(['maxlength' => 32]) ?>

    <?= $form->field($model, 'mobile')->textInput(['maxlength' => 32]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => 32]) ?>

    <?= $form->field($model, 'default')->dropDownList(\common\models\YesNo::labels()) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
