<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Brand */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Brand');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Brands'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="brand-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
