<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Cart */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Cart') . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Carts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cart-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
