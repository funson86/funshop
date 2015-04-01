<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Shipment */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Shipment');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shipments'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shipment-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
