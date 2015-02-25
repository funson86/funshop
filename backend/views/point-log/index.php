<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use common\models\PointLog;

/* @var $this yii\web\View */
/* @var $searchModel common\models\PointLogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Point Logs');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="point-log-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'Point Log'), ['create'], ['class' => 'btn btn-success']) ?>
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
            [
                'attribute' => 'type',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->type === PointLog::POINT_TYPE_BOUGHT) {
                        $class = 'label-success';
                    } elseif ($model->type === PointLog::POINT_TYPE_COMMENT) {
                        $class = 'label-warning';
                    } else {
                        $class = 'label-danger';
                    }

                    return '<span class="label ' . $class . '">' . PointLog::getTypeLabels($model->type) . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'type',
                    PointLog::getTypeLabels(),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'PROMPT_STATUS')]
                )
            ],
            'point',
            'remark',
            'balance',
            'created_at:date',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
