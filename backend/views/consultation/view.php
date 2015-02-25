<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Consultation */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Consultations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="consultation-view">

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
            // 'user_id',
            'username',
            [
                'attribute' => 'product_id',
                'value' => $model->product ? $model->product->name : '-',
            ],
            // 'type',
            'question:ntext',
            'answer:ntext',
            [
                'attribute' => 'status',
                'value' => \common\models\Status::labels($model->status),
            ],
            'created_at:date',
            'updated_at:date',
            [
                'attribute' => 'created_by',
                'value' => $model->createdBy->username,
            ],
            [
                'attribute' => 'updated_by',
                'value' => $model->updatedBy->username,
            ],
        ],
    ]) ?>

</div>
