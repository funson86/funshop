<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\OrderLog */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Order Log') . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Order Logs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="order-log-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
