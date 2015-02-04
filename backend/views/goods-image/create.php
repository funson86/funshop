<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\GoodsImage */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Goods Image');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Goods Images'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="goods-image-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
