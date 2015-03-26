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
    <form id="payform" target="_blank" name="payform" method="post" action="/trade/doPay">
        <input type="hidden" id="org.codehaus.groovy.grails.SYNCHRONIZER_TOKEN" value="190410e2-616a-4d45-af9a-3e26bc883095" name="org.codehaus.groovy.grails.SYNCHRONIZER_TOKEN">
        <input type="hidden" id="org.codehaus.groovy.grails.SYNCHRONIZER_URI" value="/trade/checkout" name="org.codehaus.groovy.grails.SYNCHRONIZER_URI">
        <input type="hidden" id="org.codehaus.groovy.grails.SYNCHRONIZER_TOKEN" value="73fe148e-9d89-448c-9b81-426127a2467c" name="org.codehaus.groovy.grails.SYNCHRONIZER_TOKEN">
        <input type="hidden" id="org.codehaus.groovy.grails.SYNCHRONIZER_URI" value="/trade/checkout" name="org.codehaus.groovy.grails.SYNCHRONIZER_URI">
        <input type="hidden" id="trade-id" value="15021661000005523738" name="id">
        <input type="hidden" id="fenqi_num" value="" name="fenqi_num">
        <!-- 余额支付 -->
        <div id="pay-box" class="pay-box cle">
            <dl class="platform">
                <dt><b>平台支付</b>支持所有银行卡或信用卡，更迅速、安全</dt>
                <dd>
                    <ul class="methods_info">
                        <li>
                            <div class="banks-bd selected">
                                <input type="radio" onclick="ga('send','event','付款方式','click','支付宝');" value="ALIPAY" checked="checked" name="channel">
                                <label class="zhifu"></label>
                            </div>
                            <p class="info">支持国内外160多家银行<br>
                                以及VISA、MasterCard</p>
                        </li>
                        <li>
                            <div class="banks-bd">
                                <input type="radio" value="ALIPAY_SM" name="channel">
                                <label class="alipay_sm"></label>
                            </div>
                            <p class="info">手机扫一扫，支付快捷又方便<br>
                                今天你扫了吗</p>
                        </li>
                        <li>
                            <div class="banks-bd">
                                <input type="radio" onclick="ga('send','event','付款方式','click','财付通');" value="TENPAY" name="channel">
                                <label class="cft"></label>
                            </div>
                            <p class="info vmid">支持60多家银行</p>
                        </li>
                        <li>
                            <div class="banks-bd">
                                <input type="radio" onclick="ga('send','event','付款方式','click','手机支付');" value="CMPAY" name="channel">
                                <label class="shouji"></label>
                            </div>
                            <p class="info vmid">中国移动旗下支付平台</p>
                        </li>
                    </ul>
                </dd>
            </dl>
            <dl class="banks">
                <dt><b>网银支付</b>银行卡或信用卡</dt>
                <dd>
                    <ul class="methods_info">
                        <li>
                            <div class="banks-bd">
                                <input type="radio" value="PSBC0" name="channel">
                                <label class="youzheng"></label>
                                <i class="ka-type">储蓄卡</i> </div>
                        </li>
                        <li>
                            <div class="banks-bd">
                                <input type="radio" value="CMB" name="channel">
                                <label class="zhaoshang"></label>
                            </div>
                        </li>
                        <li>
                            <div class="banks-bd">
                                <input type="radio" value="ICBC" name="channel">
                                <label class="gongshang"></label>
                            </div>
                        </li>
                        <li>
                            <div class="banks-bd">
                                <input type="radio" value="CFT_CCB" name="channel">
                                <label class="jianshe"></label>
                            </div>
                        </li>
                    </ul>
                    <!-- 其他银行 -->
                    <ul id="other-banks" class="methods_info">
                        <li style="display:none;"></li>
                        <li style="display:none;"></li>
                        <li> <a class="other-bank-btn" href="javascript:;">选择其他银行<i class="glyphicon glyphicon-chevron-right"></i></a> </li>
                    </ul>
                </dd>
            </dl>
            <dl class="other">
                <dt><b>其他支付方式</b></dt>
                <dd>
                    <p><a class="graybtn" href="/trade/pay4me/15021661000005523738">他人代付</a></p>
                    <p><a id="huikuan-btn" class="graybtn" href="javascript:;">银行汇款</a></p>
                </dd>
            </dl>
        </div>
    </form>
    <div class="pay_line"> <span class="methods_info" id="pay-intro" style="display: inline-block;">使用
    <label class="zhifu"></label>
    支付<span class="red">￥<em><?= $model->amount ?></em></span></span> <a href="javascript:;" id="pay-btn" class="btn">去付款<i class="glyphicon glyphicon-chevron-right"></i></a> </div>
</div>

<?php
$urlCoupon = Yii::$app->urlManager->createUrl(['cart/json-coupon']);
$urlCouponCode = Yii::$app->urlManager->createUrl(['cart/ajax-coupon-code']);
$js = <<<JS
jQuery("#trade-showbtn").click(function(){
    if ($('.trade-detail').css('display') == 'none') {
        $('.trade-detail').css('display', 'block');
    } else {
        $('.trade-detail').css('display', 'none');
    }
});
JS;

$this->registerJs($js);