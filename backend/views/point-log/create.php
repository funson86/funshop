<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\PointLog */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Point Log');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Point Logs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="point-log-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
