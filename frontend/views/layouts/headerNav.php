<?php
use frontend\components\Nav;

$query = new \yii\db\Query();
$result = $query->select('sum(number) as number')->from('cart')->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : -1)])->createCommand()->queryOne();
$totalNumber = $result['number'];

?>
<div class="hd_nav">
    <div class="hd_nav_bd cle">
        <div class="main_nav" id="main_nav">
            <div class="main_nav_link">
                <a href="javascript:;">全部商品分类</a>
            </div>
            <div class="main_cata" id="J_mainCata">
                <?php
                $allCategory = \common\models\Category::get(0, \common\models\Category::find()->asArray()->all());
                foreach ($allCategory as $category) {

                    if ($category["parent_id"] == 0) {
                        $menuItems[$category['id']] = [
                            'label' => $category['name'],
                            'url' => ['/category/view', 'id' => $category['id']],
                        ];
                    } else {
                        $menuItems[$category['parent_id']]['items'][$category['id']] = [
                            'label' => $category['name'],
                            'url' => ['/category/view', 'id' => $category['id']],
                        ];
                    }
                }

                echo Nav::widget([
                    'options' => ['class' => ''],
                    'items' => $menuItems,
                ]);
                ?>

            </div>
            <div class="J_subCata" id="J_subCata">
            </div>
        </div>
        <ul class="sub_nav cle" id="sub_nav">
            <li><a href="<?= Yii::$app->homeUrl ?>" rel="nofollow">首页</a></li>

            <li><a target="_blank" href="<?= Yii::$app->homeUrl ?>">折扣信息</a></li>
            <li><a target="_blank" href="<?= Yii::$app->homeUrl ?>" rel="nofollow">100%正品</a></li>
            <li><a target="_blank" href="<?= Yii::$app->homeUrl ?>">手机商城</a></li>
        </ul>
        <div class="hd_cart" id="head_cart">
            <a class="tit" href="<?= Yii::$app->urlManager->createUrl(['/cart']) ?>"><b class="glyphicon glyphicon-shopping-cart"></b>去购物车结算<span><i class="glyphicon glyphicon-play"></i></span><em class="num" id="hd_cartnum" <?php if ($totalNumber > 0) { ?>style="visibility: visible"<?php } ?>><?= $totalNumber ?></em></a>
            <div class="list"><p class="load"></p></div>
        </div>
    </div>
</div>

<?php
$js = <<<JS
jQuery("#J_mainCata").mouseenter(function(){
    jQuery("#J_mainCata").css({"opacity":1,"height":95,"display":"block"})
});
jQuery("#J_mainCata").mouseleave(function(){
    //jQuery("#J_mainCata").css({"opacity":0,"height":0,"display":"none"})
});
jQuery("#head_cart").mouseenter(function(){
    jQuery(this).addClass('hd_cart_hover');
    jQuery.getJSON("/cart/json-list", function(data, status) {
        if (status == "success") {
            var str = data_class = '';
            jQuery.each(data.data, function(l, v){
                str += '<dl><dt><a target="_blank" href="/product/' + v.product_id + '"><img src="' + v.thumb + '"></a></dt><dd><h4><a target="_blank" href="/product/' + v.product_id + '">' + v.name + '</a></h4><p><span class="red">￥' + v.price + "</span>&nbsp;<i>X</i>&nbsp;" + v.number + '</p><a class="iconfont del" title="删除" href="javascript:;" data-lid="' + v.id + '" data-taocan="">&#x164;</a></dd></dl>';
                if (l > 5) {
                    data_class = " data_over";
                }
            });
            str += '<div class="data">' + data_class + '</div><div class="count">共<span class="red" id="hd_cart_count">' + data.totalNumber + '</span>件商品，满99元就包邮哦~<p>总价:<span class="red">￥<em id="hd_cart_total">' + data.totalPrice + '</em></span><a href="/cart" class="btn">去结算</a></p></div>';
            jQuery("#head_cart").find('.list').html(str);
        }
    }).error(function(){
        jQuery("#head_cart").find('.list').html('<p class="fail"><i class="iconfont">&#371;</i><br>购物车数据加载失败<br>请稍后再试</p>');
    });
});
jQuery("#head_cart").mouseleave(function(){
    jQuery(this).removeClass('hd_cart_hover');
});
JS;

$this->registerJs($js);
?>