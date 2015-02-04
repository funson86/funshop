<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Goods */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Goods');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Goods'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="goods-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
