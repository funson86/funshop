<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Coupon */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Coupon');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Coupons'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="coupon-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
