<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\GoodsImage */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Goods Image') . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Goods Images'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="goods-image-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
