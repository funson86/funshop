<?php
/* @var $this yii\web\View */
$this->title = Yii::t('app', 'My') . Yii::t('app', 'Order');
$this->params['breadcrumbs'][] = $this->title;

?>

    <div class="trade_mod">
        <div class="my_point">
            <h1><?= $this->title ?></h1>
            <div class="trade_sort">
                <ul class="cle_float">
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['order/index', 'status' => \common\models\Order::PAYMENT_STATUS_UNPAID]) ?>" class="">待付款订单( 2 )</a></li>
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['order/index']) . '?status=' . \common\models\Order::PAYMENT_STATUS_COD . ',' . \common\models\Order::PAYMENT_STATUS_PAID ?>" class="">待发货订单( 0 )</a></li>
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['order/index', 'status' => \common\models\Order::SHIPMENT_STATUS_SHIPPED]) ?>" class="">待收货订单( 0 )</a></li>
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['order/index', 'status' => \common\models\Order::SHIPMENT_STATUS_RECEIVED]) ?>" class="">待评价订单( 0 )</a></li>
                </ul>
            </div>
            <h3 class="h301"><strong>我的全部订单</strong><a class="r" href="<?= Yii::$app->urlManager->createUrl(['order/index', 'status' => \common\models\Order::STATUS_DELETED]) ?>">订单回收站</a></h3>
            <table width="100%" id="trade-list" class="trade_tb01">
                <tbody>
                <tr class="tb1_hd">
                    <td align="left">
                        <span class="pl12">订单查询： </span>
                        <input type="text" class="txt" name="sn" id="sn" value="<?= Yii::$app->request->get('sn') ?>">
                        <input type="button" id="search_btn" class="btn" value="查询 ">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td colspan="2">
                        <div class="plf30">
                            <span class="pl12">状态：</span>
                            <select id="selectStatus">
                                <option selected="">全部</option>
                                <option value="<?= \common\models\Order::PAYMENT_STATUS_UNPAID ?>">未付款</option>
                                <option value="<?= \common\models\Order::PAYMENT_STATUS_COD . ',' .\common\models\Order::PAYMENT_STATUS_PAID ?>">等待发货</option>
                                <option value="<?= \common\models\Order::SHIPMENT_STATUS_SHIPPED ?>">等待收货</option>
                                <option value="<?= \common\models\Order::SHIPMENT_STATUS_RECEIVED ?>">已确认收货</option>
                                <option value="<?= \common\models\Order::STATUS_CANCEL ?>">已取消</option>
                            </select>
                        </div>
                    </td>
                </tr>
                </tbody>
                <?php foreach ($orders as $item) { ?>
                    <tbody>
                    <tr>
                        <th><p class="mt5 pl12"><span class="gray888">订单编号：<a href="<?= Yii::$app->urlManager->createUrl(['order/view', 'id' => $item->id]) ?>" target="_blank"><?= $item->sn ?></a></span> &nbsp; &nbsp; 下单时间：<?= Yii::$app->formatter->asDatetime($item->created_at) ?></p></th>
                        <th width="120"> <em class="em02 tstatus_17"> <?= \common\models\Order::getStatusLabels($item->status) ?> </em> </th>
                        <th width="220" class="trade-count"><em>订单金额：￥</em> <em class="em_price"> <?= $item->amount ?> </em> </th>
                    </tr>
                    <tr>
                        <td class="items">
                            <?php foreach ($item->orderProducts as $product) { ?>
                                <dl class="cle_float">
                                    <dd class="trade_img"><img src="<?= $product->thumb ?>"></dd>
                                    <dt class="trade_title"><a target="_blank" href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->product_id]) ?>"><?= $product->name ?> </a></dt>
                                    <dd class="trade_price">￥<?= $product->price ?> x <?= $product->number ?></dd>
                                    <dd class="trade_rebuy"><a rel="nofollow" href="javascript:void(0);" class="J_addCart">再次购买</a></dd>
                                </dl>
                            <?php } ?>
                        </td>
                        <td class="status"></td>
                        <td class="operate">
                            <div>
                                <a href="<?= Yii::$app->urlManager->createUrl(['order/view', 'id' => $item->id]) ?>" class="graybtn" target="_blank">查看详情</a>
                                <?php if ($item->payment_method == \common\models\Order::PAYMENT_METHOD_PAY && $item->payment_status == \common\models\Order::PAYMENT_STATUS_UNPAID) { ?><a class="btn" href="<?= Yii::$app->urlManager->createUrl(['cart/pay', 'id' => $item->sn]) ?>" target="_blank">去付款</a><?php } ?>
                            </div>
                            <div>
                                <input type="hidden" name="order_id" value="<?= $item->id ?>">
                                <?php if ($item->status == \common\models\Order::PAYMENT_STATUS_UNPAID) { ?>
                                    <a href="javascript:;" class="graybtn order-cancel" data-link="<?= Yii::$app->urlManager->createUrl(['order/ajax-status', 'id' => $item->id, 'status' => \common\models\Order::STATUS_CANCEL]) ?>">取消订单</a><div class="cancel-tip" style="display: block;"><i>♦</i><i class="btm">♦</i><p><em class="red">下单后24小时内没有支付</em>系统将自动取消</p></div>
                                <?php } elseif ($item->status != \common\models\Order::STATUS_DELETED) { ?>
                                    <a class="graybtn order-delete" data-link="<?= Yii::$app->urlManager->createUrl(['order/ajax-status', 'id' => $item->id, 'status' => \common\models\Order::STATUS_DELETED]) ?>" href="javascript:;">删除订单</a>
                                <?php } ?>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                <?php } ?>
            </table>
            <div class="pagination-right">
                <?= \yii\widgets\LinkPager::widget(['pagination' => $pagination]) ?>
            </div>
        </div>
    </div>

<?php
$js = <<<JS
jQuery("#search_btn").click(function(){
    if (jQuery("#sn").val()) {
        location.href = '?sn=' + jQuery("#sn").val();
    }
});
jQuery("#selectStatus").change(function(){
    location.href = '?status=' + jQuery("#selectStatus").val();
});
jQuery(".order-cancel").click(function(){
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            location.reload()
        }
    });
});
jQuery(".order-delete").click(function(){
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            alert('成功删除订单');
            location.reload()
        }
    });
});
JS;

$this->registerJs($js);

