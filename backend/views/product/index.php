<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use common\models\Category;
use common\models\Status;
use common\models\YesNo;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Products');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'Product'), ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a(Yii::t('app', 'Batch ') . Yii::t('app', 'Delete'), '#', ['class' => 'btn btn-danger', 'id' => 'batchDelete']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\CheckboxColumn'],

            'id',
            [
                'attribute' => 'category_id',
                'value'=>function ($model) {
                    return $model->category->name;
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'category_id',
                    ArrayHelper::map(Category::get(0, Category::find()->asArray()->all()), 'id', 'label'),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                ),
            ],
            'name',
            'sku',
            'stock',
            // 'weight',
            'market_price',
            'price',
            // 'brief',
            // 'content:ntext',
            // 'thumb',
            // 'image',
            // 'origin',
            // 'keywords',
            // 'description:ntext',
            [
                'attribute' => 'type',
                'format' => 'html',
                'value' => function ($model) {
                    return \common\models\ProductType::labels($model->type);
                },
                /*'filter' => Html::activeDropDownList(
                    $searchModel,
                    'type',
                    YesNo::labels(),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                )*/
            ],
            [
                'attribute' => 'brand_id',
                'value' => function ($model) {
                    return $model->brand ? $model->brand->name : '-';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'type',
                    ArrayHelper::map(\common\models\Brand::find()->all(), 'id', 'name'),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                )
            ],
            [
                'attribute' => 'status',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->status === Status::STATUS_ACTIVE) {
                        $class = 'label-success';
                    } elseif ($model->status === Status::STATUS_INACTIVE) {
                        $class = 'label-warning';
                    } else {
                        $class = 'label-danger';
                    }

                    return '<span class="label ' . $class . '">' . Status::labels($model->status) . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'status',
                    Status::labels(),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'PROMPT_STATUS')]
                )
            ],

            'created_at:date',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>

<?php
$urlBatchDelete = \yii\helpers\Url::to(['/product/batch-delete']);
$js = <<<JS
jQuery(document).ready(function() {
    $("#batchDelete").click(function() {
        var keys = $("#w0").yiiGridView("getSelectedRows");
        $.ajax({
            type: "POST",
            url: "{$urlBatchDelete}",
            dataType: "json",
            data: {ids: keys}
        });
    });
});
JS;
$this->registerJs($js, \yii\web\View::POS_END);

