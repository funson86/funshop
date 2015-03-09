<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\SearchLog */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Search Log');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Search Logs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="search-log-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
