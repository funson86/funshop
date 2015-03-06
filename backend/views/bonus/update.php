<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Bonus */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Bonus') . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Bonuses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="bonus-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
