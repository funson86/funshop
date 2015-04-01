<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\DetailView;
use yii\grid\GridView;
use common\models\Order;

/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $form yii\widgets\ActiveForm */
$this->title = Yii::t('app', 'Order') . Yii::t('app', 'Shipment');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Orders'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="order-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-3\">{input}{hint}</div>\n<div class=\"col-lg-5\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-2 control-label'],
        ],
    ]); ?>


    <?= Html::activeHiddenInput($model, 'shipment_status', ['value' => Order::SHIPMENT_STATUS_SHIPPED]) ?>

    <?= $form->field($model, 'shipment_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Shipment::find()->all(), 'id', 'name')) ?>

    <?= $form->field($model, 'shipment_name')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'shipment_fee')->textInput(['maxlength' => 10]) ?>

    <div class="form-group">
        <label class="col-lg-2 control-label" for="">&nbsp;</label>
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
