<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\SearchLog */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Search Log') . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Search Logs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="search-log-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
