<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Favorite */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Favorites'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="favorite-view">

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'attribute' => 'user_id',
                'value' => $model->user ? $model->user->username : '-',
            ],
            [
                'attribute' => 'product_id',
                'value' => $model->product ? $model->product->name : '-',
            ],
            // 'attention',
            'created_at:datetime',
            'updated_at:datetime',
        ],
    ]) ?>

</div>
