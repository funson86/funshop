<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Favorite */

$this->title = Yii::t('app', 'Update ') . Yii::t('app', 'Favorite') . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Favorites'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="favorite-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
