<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CartSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Carts');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cart-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Clean ') . Yii::t('app', 'Cart'), ['clean'], ['class' => 'btn btn-success', 'data-method' => 'post', 'data-confirm' => Yii::t('app', 'Are you sure you want to clean?')]) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            [
                'attribute' => 'user_id',
                'value'=>function ($model) {
                    return $model->user ? $model->user->username : '-';
                },
            ],
            'session_id',
//            'product_id',
            'name',
            'sku',
            'number',
            // 'market_price',
            'price',
            // 'thumb',
            // 'type',
            'created_at:date',
            // 'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
