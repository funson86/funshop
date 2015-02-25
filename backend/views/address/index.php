<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use common\models\YesNo;

/* @var $this yii\web\View */
/* @var $searchModel common\models\AddressSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Addresses');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="address-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'Address'), ['create'], ['class' => 'btn btn-success']) ?>
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
            'name',
            'consignee',
            //'country',
            // 'province',
            // 'city',
            // 'district',
            [
                'attribute' => 'region',
                'value' => function ($model) {
                    return (isset($model->country0) ? $model->country0->name : '-') . (isset($model->province0) ? $model->province0->name : '-') . (isset($model->city0) ? $model->city0->name : '-') . (isset($model->district0) ? $model->district0->name : '-');
                },
                /*'filter' => Html::activeDropDownList(
                    $searchModel,
                    'province',
                    ArrayHelper::map(\common\models\Region::find()->all(), 'id', 'name'),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                )*/
            ],
            'address',
            // 'zipcode',
            // 'phone',
            // 'mobile',
            // 'email:email',
            // 'default',
            [
                'attribute' => 'default',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->default === YesNo::YES) {
                        $class = 'label-success';
                    } elseif ($model->default === YesNo::NO) {
                        $class = 'label-warning';
                    } else {
                        $class = 'label-danger';
                    }

                    return '<span class="label ' . $class . '">' .YesNo::labels($model->default) . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'default',
                    YesNo::labels(),
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
