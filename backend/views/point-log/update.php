<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\PointLog */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Point Log') . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Point Logs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="point-log-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
