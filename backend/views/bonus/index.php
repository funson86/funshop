<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel common\models\BonusSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Bonuses');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bonus-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <!--p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'Bonus'), ['create'], ['class' => 'btn btn-success']) ?>
    </p-->

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
            [
                'attribute' => 'bonus_type_id',
                'format' => 'html',
                'value' => function ($model) {
                    return $model->bonusType ? $model->bonusType->name : '-';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'bonus_type_id',
                    ArrayHelper::map(\common\models\BonusType::find()->all(), 'id', 'name'),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                )
            ],
            'sn',
            [
                'attribute' => 'order_id',
                'value' => function ($model) {
                    return $model->order_id ? $model->order_id : '-';
                },
            ],
            [
                'attribute' => 'used_at',
                'value' => function ($model) {
                    return $model->used_at ? Yii::$app->formatter->asDatetime($model->used_at) : '-';
                },
            ],
            'created_at:date',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view}',
            ],
        ],
    ]); ?>

</div>
