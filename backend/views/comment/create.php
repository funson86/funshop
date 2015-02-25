<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Comment */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Comment');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Comments'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="comment-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
