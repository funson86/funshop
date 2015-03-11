<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\CouponType */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Coupon Type');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Coupon Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="coupon-type-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
