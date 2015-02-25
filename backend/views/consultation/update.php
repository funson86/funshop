<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Consultation */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Consultation') . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Consultations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="consultation-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
