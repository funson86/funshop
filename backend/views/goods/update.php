<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Goods */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Goods') . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Goods'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="goods-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
