<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Product */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Products'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$file = Yii::getAlias('@frontend/web' . $model->thumb);
$fileType = \yii\helpers\FileHelper::getMimeType($file);
$data = base64_encode(file_get_contents($file));
?>
<style>
td img{width:100px;}
</style>
<div class="product-view">

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
                'attribute' => 'category_id',
                'value' => $model->category ? $model->category->name : '-',
            ],
            'name',
            'sku',
            'stock',
            'weight',
            'market_price',
            'price',
            'brief',
            'content:ntext',
            [
                'attribute' => 'thumb',
                'format' => 'image',
                'value' => "data:" . $fileType .";base64," . $data . "",
                'options' => ['style' => 'width:100px' ],
            ],
            'image',
            'keywords',
            'description:ntext',
            [
                'attribute' => 'type',
                'value' => \common\models\YesNo::labels($model->type),
            ],
            [
                'attribute' => 'status',
                'value' => \common\models\Status::labels($model->status),
            ],
            'created_at:datetime',
            'updated_at:datetime',
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

<?php
foreach ($model->productImagesSort as $item) {
    $file = Yii::getAlias('@frontend/web' . $item->thumb);
    $fileType = \yii\helpers\FileHelper::getMimeType($file);
    $data = base64_encode(file_get_contents($file));
    echo "<img src='data:" . $fileType .";base64," . $data . "' width=100>";
}
