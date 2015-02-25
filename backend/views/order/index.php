<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use common\models\Order;

/* @var $this yii\web\View */
/* @var $searchModel common\models\OrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Orders');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <!--p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'Order'), ['create'], ['class' => 'btn btn-success']) ?>
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
            'sn',
            'consignee',
            [
                'attribute' => 'address',
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
            // 'province',
            // 'city',
            // 'district',
            // 'address',
            // 'zipcode',
            // 'phone',
            'mobile',
            // 'email:email',
            // 'remark',
            // 'payment_method',
            [
                'attribute' => 'payment_status',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->payment_status === Order::PAYMENT_STATUS_PAID) {
                        $class = 'label-success';
                    } elseif ($model->payment_status === Order::PAYMENT_STATUS_COD) {
                        $class = 'label-warning';
                    } elseif ($model->payment_status === Order::PAYMENT_STATUS_UNPAID) {
                        $class = 'label-danger';
                    } else {
                        $class = 'label-info';
                    }

                    return '<span class="label ' . $class . '">' . ($model->payment_status ? Order::getPaymentStatusLabels($model->payment_status) : '-') . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'payment_status',
                    Order::getPaymentStatusLabels(),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'PROMPT_STATUS')]
                )
            ],
            // 'payment_id',
            // 'payment_name',
            // 'payment_fee',
            [
                'attribute' => 'shipment_status',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->shipment_status === Order::SHIPMENT_STATUS_RECEIVED) {
                        $class = 'label-success';
                    } elseif ($model->shipment_status === Order::SHIPMENT_STATUS_SHIPPED) {
                        $class = 'label-warning';
                    } elseif ($model->shipment_status === Order::SHIPMENT_STATUS_PREPARING) {
                        $class = 'label-danger';
                    } else {
                        $class = 'label-info';
                    }

                    return '<span class="label ' . $class . '">' . ($model->shipment_status ? Order::getShipmentStatusLabels($model->shipment_status) : '-') . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'shipment_status',
                    Order::getShipmentStatusLabels(),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'PROMPT_STATUS')]
                )
            ],
            // 'shipment_id',
            // 'shipment_name',
            // 'shipment_fee',
            'amount',
            // 'tax',
            // 'invoice',
            [
                'attribute' => 'status',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->status === Order::SHIPMENT_STATUS_RECEIVED) {
                        $class = 'label-success';
                    } elseif ($model->status === Order::PAYMENT_STATUS_UNPAID) {
                        $class = 'label-warning';
                    } elseif ($model->status === Order::STATUS_CANCEL || $model->status === Order::STATUS_DELETED) {
                        $class = 'label-danger';
                    } else {
                        $class = 'label-info';
                    }

                    return '<span class="label ' . $class . '">' . Order::getStatusLabels($model->status) . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'status',
                    Order::getStatusLabels(),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'PROMPT_STATUS')]
                )
            ],
            // 'paid_at',
            // 'shipped_at',
            'created_at:date',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
