<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel common\models\GoodsImageSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Goods Images');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="goods-image-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'Goods Image'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'goods_id',
            'url:url',
            'description',
            'thumb_url:url',
            // 'origin_url:url',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
