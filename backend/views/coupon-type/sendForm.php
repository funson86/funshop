<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\CouponType */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="coupon-type-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php if ($model->type == \common\models\CouponType::COUPON_TYPE_OFFLINE) { ?>
        <?= $form->field($model, 'numbers')->textInput()->hint(Yii::t('app', 'Users separated by ,')) ?>
    <?php } else { ?>
        <?= $form->field($model, 'users')->textarea(['rows' => 6])->hint(Yii::t('app', 'Users separated by ,')) ?>
    <?php } ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Send'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
