<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Coupon */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Coupon') . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Coupons'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="coupon-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
