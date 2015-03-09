<?php
use common\models\Region;

$this->title = Yii::t('app', 'My') . Yii::t('app', 'Order');
$this->params['breadcrumbs'][] = $this->title;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/order-view.css', ['depends' => \frontend\assets\AppAsset::className()]);
$totalNumber = $totalPrice = 0;
?>
<div id="main">
    <div class="Detail_inf">
        <div class="Detail_inf_shang">
            <?php if ($model->status == \common\models\Order::PAYMENT_STATUS_UNPAID || $model->status == \common\models\Order::PAYMENT_METHOD_COD) { ?><a id="order-cancel" href="javascript:void(0);" style="float:right; margin-top:18px;" data-link="<?= Yii::$app->urlManager->createUrl(['order/ajax-status', 'id' => $model->id, 'status' => \common\models\Order::STATUS_CANCEL]) ?>">取消订单</a><?php } ?>
            <ul>
                <li>订单号：<?= $model->sn ?></li>
                <li>状态： <span> <?= \common\models\Order::getStatusLabels($model->status) ?> </span> </li>
                <li>
                    <div id="trade_info"> </div>
                </li>
            </ul>
            <div style="clear:both"></div>
        </div>
    </div>
    <div class="Order_information">
        <h2>订单信息</h2>
        <div class="User_name">
            <h3>收货人信息</h3>
            <ul>
                <li><?= $model->consignee ?>，<?= $model->mobile ?>, <?= $model->country ? Region::findOne($model->country)->name : '' ?> <?= $model->province ? Region::findOne($model->province)->name : '' ?> <?= $model->city ? Region::findOne($model->city)->name : '' ?> <?= $model->district ? Region::findOne($model->district)->name : '' ?> <?= $model->address ?></li>
            </ul>
        </div>
        <div class="User_name">
            <h3>送货方式</h3>
            <ul>
                <li>快递送货上门，时间不限</li>
            </ul>
        </div>
        <div class="User_name">
            <h3>快递跟踪</h3>
            <ul>
                <li> 无包裹追踪信息 </li>
            </ul>
        </div>
        <!-- 商品清单 开始 -->
        <div class="User_name">
            <h3>商品清单</h3>
        </div>
        <div class="goods-list">
            <div class="hd cle">
                <div class="td">小计</div>
                <div class="td td-num">数量</div>
                <div class="td">单价</div>
            </div>
            <ul>
                <?php foreach ($model->orderProducts as $product) { ?>
                <li class="cle">
                    <div class="pic"> <a target="_blank" href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->product_id]) ?>"> <img src="<?= $product->thumb ?>" alt="<?= $product->name ?>"> </a> </div>
                    <div class="name"> <a target="_blank" href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->product_id]) ?>"><span><?= $product->name ?></span><i></i> </a> </div>
                    <div class="price-one"> ￥<em><?= $product->price ?></em> </div>
                    <div class="nums"> <em><?= $product->number ?></em> </div>
                    <div class="price-xj"> ￥<em><?= $product->price * $product->number ?></em> </div>
                </li>
                <?php $totalNumber += $product->number; $totalPrice += $product->price * $product->number; } ?>
            </ul>
        </div>
        <div class="list-total"> <em><?= $totalNumber ?></em>件商品，

            总价：<span class="red">￥<em><?= $totalPrice ?></em></span> </div>
        <div class="total-count">
            <p>邮费：￥&nbsp; <?= $model->shipment_fee; ?> </p>
            <div class="tobe-pay">总金额：<span class="red">￥<em id="total-price"><?= $model->amount ?></em></span></div>
        </div>
        <!-- 商品清单 end -->
    </div>
</div>

<?php
$js = <<<JS
jQuery("#order-cancel").click(function(){
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            location.reload()
        }
    });
});
JS;

$this->registerJs($js);
