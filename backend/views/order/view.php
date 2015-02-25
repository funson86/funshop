<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\DetailView;
use common\models\Order;

/* @var $this yii\web\View */
/* @var $model common\models\Order */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Orders'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-view">

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

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            'product_id',
            'name',
            'sku',
            'price',
            'number',
            [
                'attribute' => 'total',
                'value'=>function ($model) {
                    return $model->number * $model->price;
                },
            ],
        ],
    ]); ?>


    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'attribute' => 'user_id',
                'value' => $model->user ? $model->user->username : '-',
            ],
            'sn',
            'consignee',
//            'country',
//            'province',
//            'city',
//            'district',
//            'address',
            [
                'attribute' => 'address',
                'value' => (isset($model->country0) ? $model->country0->name : '-') . (isset($model->province0) ? $model->province0->name : '-') . (isset($model->city0) ? $model->city0->name : '-') . (isset($model->district0) ? $model->district0->name : '-') . $model->address,
            ],
            'zipcode',
            'phone',
            'mobile',
            'email:email',
            'remark',
            [
                'attribute' => 'payment_method',
                'value' => Order::getPaymentMethodLabels($model->payment_method),
            ],
            [
                'attribute' => 'payment_status',
                'value' => $model->payment_status ? Order::getPaymentStatusLabels($model->payment_status) : '-',
            ],
            'payment_id',
            'payment_name',
            'payment_fee',
            [
                'attribute' => 'shipment_status',
                'value' => $model->shipment_status ? Order::getShipmentStatusLabels($model->shipment_status) : '-',
            ],
            'shipment_id',
            'shipment_name',
            'shipment_fee',
            'amount',
            'tax',
            'invoice',
            [
                'attribute' => 'status',
                'value' => Order::getStatusLabels($model->status),
            ],
            'paid_at:datetime',
            'shipped_at:datetime',
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
