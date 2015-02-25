<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Favorite */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Favorite');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Favorites'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="favorite-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
