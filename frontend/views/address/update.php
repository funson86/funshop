<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Address */

$this->title = 'Update Address: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Addresses', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<?= $this->render('_form', [
    'model' => $model,
]) ?>

