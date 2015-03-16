<?php
/* @var $this yii\web\View */
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
$this->registerCssFile('@web/css/favorite.css', ['depends' => \frontend\assets\AppAsset::className()]);

$this->title = Yii::t('app', 'User Center');
$this->params['breadcrumbs'][] = $this->title;
$i = 0;
?>

<div class="ilizi cle">
    <p><strong><?= Yii::$app->user->identity->username ?></strong>, 欢迎来到华之腾网上商城</p>
    <p><span><i class="glyphicon glyphicon-usd"></i>我的积分：<?= Yii::$app->user->identity->point ?></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?= Yii::$app->urlManager->createUrl(['user/profile']) ?>"><i class="glyphicon glyphicon-user"></i>完善个人信息</a></p>
</div>
<div class="trade_mod i_marb">
    <div class="my_point">
        <h3 class="h301">
            <strong>我的订单</strong>
            <span class="link_order">
                <a href="<?= Yii::$app->urlManager->createUrl(['order/index', 'status' => \common\models\Order::PAYMENT_STATUS_UNPAID]) ?>">待付款（<i>0</i>）</a>
                | <a href="<?= Yii::$app->urlManager->createUrl(['order/index']) . '?status=' . \common\models\Order::PAYMENT_STATUS_COD . ',' . \common\models\Order::PAYMENT_STATUS_PAID ?>">待发货（<i>0</i>）</a>
                | <a href="<?= Yii::$app->urlManager->createUrl(['order/index', 'status' => \common\models\Order::SHIPMENT_STATUS_SHIPPED]) ?>">待收货（<i>0</i>）</a>
                | <a href="<?= Yii::$app->urlManager->createUrl(['order/index', 'status' => \common\models\Order::SHIPMENT_STATUS_RECEIVED]) ?>">待评价（<i>0</i>）</a>
            </span>
            <a class="r more" href="<?= Yii::$app->urlManager->createUrl(['order/index']) ?>">更多&gt;&gt;</a>
        </h3>
        <?php if (count($orders)) { ?>
            <table width="100%" id="trade-list" class="trade_tb01">
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
        <?php } else { ?>
            <div class="i_min_height">您还没有订单，马上去挑选心仪的商品吧~</div>
        <?php } ?>
    </div>
</div>
<div class="trade_mod i_marb">
    <div class="my_point">
        <h3 class="h301"><strong>我的收藏</strong><a class="r more" href="<?= Yii::$app->urlManager->createUrl(['user/favorite']) ?>">更多&gt;&gt;</a></h3>
        <?php if (count($favorites)) { ?>
            <div class="fav-list">
                <ul class="cle" id="fav-list">
                    <?php foreach ($favorites as $product) { ?>
                        <li>
                            <div class="bd">

                                <div class="pic"> <a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->id]) ?>" target="_blank"><img src="<?= $product->thumb ?>" alt=""></a> </div>
                                <p class="price"> <span class=""></span> <span class="">￥<b><?= $product->price ?></b></span></p>
                                <p class="name"><a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->id]) ?>" target="_blank"><?= $product->name ?></a></p>
                            </div>
                        </li>
                    <?php } ?>
                </ul>
            </div>
        <?php } else { ?>
            <div class="i_min_height">您还没有收藏过商品，收藏商品有活动我们会第一时间通知你哟~</div>
        <?php } ?>
    </div>
</div>
<div class="trade_mod i_marb">
    <div id="J_bestList" class="my_point my_coupons c_tb01">
        <h3 class="h301"><strong>我的优惠劵</strong><a class="r more" href="<?= Yii::$app->urlManager->createUrl(['user/coupon']) ?>">更多&gt;&gt;</a></h3>
        <?php if (count($favorites)) { ?>
            <table id="address_list" class="admin_table">
                <tbody>
                <tr>
                    <th>面值</th>
                    <th>所需消费金额</th>
                    <th>编码</th>
                    <th>有效期</th>
                    <th>发送时间</th>
                </tr>
                <?php foreach ($coupons as $item) { $i++; ?>
                    <tr <?php if ($i %2 == 0) { ?>style="background-color: rgb(249, 249, 249);" <?php } ?>>
                        <td align="center">￥<?= $item->money ?></td>
                        <td align="center">￥<?= $item->min_amount ?></td>
                        <td align="center"><?= $item->sn ? $item->sn : $item->id ?></td>
                        <td align="center"><?= Yii::$app->formatter->asDate($item->started_at) ?> 到 <?= Yii::$app->formatter->asDate($item->ended_at) ?></td>
                        <td align="center"><?= Yii::$app->formatter->asDate($item->created_at) ?></td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        <?php } else { ?>
            <div class="i_min_height">您还木有优惠券~</div>
        <?php } ?>
    </div>
</div>

<?php
$js = <<<JS
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

