<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\CouponType */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Coupon Type') . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Coupon Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="coupon-type-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
