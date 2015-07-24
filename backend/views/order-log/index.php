<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel common\models\OrderLogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Order Logs');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-log-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'Order Log'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'order_id',
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    return \common\models\Order::getStatusLabels($model->status);
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'status',
                    \common\models\Order::getStatusLabels(),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'PROMPT_STATUS')]
                )
            ],
            'remark',
            'created_at:datetime',
            // 'updated_at',
            [
                'attribute' => 'created_by',
                'value' => function ($model) {
                    return $model->createdBy ? $model->createdBy->username : '-';
                },
            ],
            // 'updated_by',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
