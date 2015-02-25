<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Cart */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Cart');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Carts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cart-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
