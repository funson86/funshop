<?php
use common\models\Region;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/pay.css', ['depends' => \frontend\assets\AppAsset::className()]);
$query = new \yii\db\Query();
$result = $query->select('sum(number) as number')->from('order_product')->where(['order_id' => $model->id])->createCommand()->queryOne();
$totalNumber = $result['number'];
?>

<div id="main">
    <!-- 订单信息 -->
    <div class="trade-info">
        <h4><?= Yii::$app->user->identity->username ?>，订单已成功提交，请付款！<span class="gray">24小时内未付款，我们将关闭交易 &gt;_&lt;</span></h4>
        <div class="trade-total"> <b>需支付：</b>￥<strong id="pay-total"><?= $model->amount ?></strong> <span class="gray">完成交易可获得<span><?= intval($model->amount) ?></span>商城积分</span> </div>
        <div class="trade-intro"> 您的订单号：<?= $model->sn ?> <a id="trade-showbtn" class="trade-showbtn" href="javascript:;"><i></i>查看订单详情</a>
            <div class="trade-detail">
                <table>
                    <tbody>
                    <tr>
                        <td class="tl">购买商品：</td>
                        <td><?= $totalNumber ?> 件&nbsp;&nbsp;&nbsp;&nbsp;应付款：¥ <em><?= $model->amount ?></em></td>
                    </tr>
                    <tr>
                        <td class="tl">购买时间：</td>
                        <td><?= Yii::$app->formatter->asDatetime($model->created_at) ?></td>
                    </tr>
                    <tr>
                        <td class="tl">收货地址：</td>
                        <td> <?= $model->country ? Region::findOne($model->country)->name : '' ?> <?= $model->province ? Region::findOne($model->province)->name : '' ?> <?= $model->city ? Region::findOne($model->city)->name : '' ?> <?= $model->district ? Region::findOne($model->district)->name : '' ?>&nbsp;&nbsp;<?= $model->address ?>&nbsp;（<?= $model->mobile ?>）
                            <p><a class="graybtn" target="_blank" href="<?= Yii::$app->urlManager->createUrl(['/order']) ?>">进入我的订单</a></p></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="pay_line"> <span class="methods_info" id="pay-intro" style="display: inline-block;">使用
    <label class="zhifu"></label>
    支付<span class="red">￥<em><?= $model->amount ?></em></span></span> <a href="javascript:;" id="pay-btn" class="btn">去付款<i class="glyphicon glyphicon-chevron-right"></i></a> </div>
</div>

<?php
$urlCoupon = Yii::$app->urlManager->createUrl(['cart/json-coupon']);
$urlCouponCode = Yii::$app->urlManager->createUrl(['cart/ajax-coupon-code']);
$js = <<<JS
jQuery("#trade-showbtn").focus(function(){
    $('.trade-detail').css('display', 'block');
});
jQuery("#trade-showbtn").blur(function(){
    $('.trade-detail').css('display', 'none');
});

JS;

$this->registerJs($js);