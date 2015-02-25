<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\DetailView;
use yii\grid\GridView;
use common\models\Order;

/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $form yii\widgets\ActiveForm */
?>

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
        'paid_at',
        'shipped_at',
        'created_at',
        'updated_at',
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


<div class="order-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-3\">{input}{hint}</div>\n<div class=\"col-lg-5\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-2 control-label'],
        ],
    ]); ?>

<!--    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'sn')->textInput(['maxlength' => 32]) ?>

    <?= $form->field($model, 'consignee')->textInput(['maxlength' => 64]) ?>

    <?= $form->field($model, 'country')->label() ?>

    <?= $form->field($model, 'province')->textInput() ?>

    <?= $form->field($model, 'city')->textInput() ?>

    <?= $form->field($model, 'district')->textInput() ?>

    <?= $form->field($model, 'address')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'zipcode')->textInput(['maxlength' => 16]) ?>

    <?= $form->field($model, 'phone')->textInput(['maxlength' => 32]) ?>

    <?= $form->field($model, 'mobile')->textInput(['maxlength' => 32]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => 32]) ?>

    <?= $form->field($model, 'remark')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'payment_method')->dropDownList(Order::getPaymentMethodLabels()) ?>
-->
    <?php if ($model->payment_method == Order::PAYMENT_METHOD_COD) { ?>
    <?= $form->field($model, 'payment_status')->dropDownList(Order::getPaymentStatusLabels()) ?>

    <?= $form->field($model, 'payment_id')->textInput() ?>

    <?= $form->field($model, 'payment_name')->textInput(['maxlength' => 120]) ?>
    <?php } ?>

    <?= $form->field($model, 'payment_fee')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'shipment_status')->dropDownList(Order::getShipmentStatusLabels()) ?>

    <?= $form->field($model, 'shipment_id')->textInput() ?>

    <?= $form->field($model, 'shipment_name')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'shipment_fee')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'tax')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'invoice')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'status')->dropDownList(Order::getStatusLabels()) ?>


    <div class="form-group">
        <label class="col-lg-2 control-label" for="">&nbsp;</label>
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
