<div class="hd_main cle cart_width">
    <div class="logo">
        <p>
            <a href="<?= Yii::$app->homeUrl ?>" class="lizi_logo">商城</a>
        </p>
    </div>
    <div class="cart_guide">
        <ul class="progress-<?= Yii::$app->session['step'] ? Yii::$app->session['step'] : 1 ?>">
            <li class="s1"><b></b>1.我的购物车</li>
            <li class="s2"><b></b>2.填写核对订单信息</li>
            <li class="s3">3.成功提交订单</li>
        </ul>
    </div>
</div>
