<?php
use yii\helpers\Html;
use frontend\components\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);

$query = new \yii\db\Query();
$result = $query->select('sum(number) as number')->from('cart')->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : 0)])->createCommand()->queryOne();
$totalNumber = $result['number'];
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
    <?php $this->beginBody() ?>
    <div id="header" class="new_header">
        <div class="hd_bar">
            <div class="bd_bar_bd cle">
                <ul class="welcome">
                    <li><a id="favorite_wb" href="javascript:;" rel="nofollow">收藏商城</a></li>
                    <li id="header_user">
                        <?php if (Yii::$app->user->isGuest) { ?>
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/login']) ?>" rel="nofollow">请登录</a><s>|</s><a href="<?= Yii::$app->urlManager->createUrl(['site/signup']) ?>" rel="nofollow">免费注册</a>
                        <?php } else { ?>
                        <a class="" href="<?= Yii::$app->urlManager->createUrl(['/user']) ?>"><?= Yii::$app->user->identity->username ?></a>&nbsp;[<a href="<?= Yii::$app->urlManager->createUrl(['site/logout']) ?>">退出</a>]
                        <?php } ?>
                    </li>
                </ul>
                <ul id="userinfo-bar">
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['/order']) ?>">我的订单</a></li>
                    <li><a href="<?= Yii::$app->urlManager->createUrl(['user/favorite']) ?>">我的收藏</a></li>
                    <li><a class="menu-link" href="#">帮助中心</a></li>
                </ul>
            </div>
        </div>
        <div class="hd_main cle">
            <div class="logo">
                <p>
                    <a href="<?= Yii::$app->homeUrl ?>" class="lizi_logo">商城</a>
                </p>
            </div>
            <div class="search_box">
                <form action="<?= Yii::$app->urlManager->createUrl(['product/search']) ?>" method="get" id="search_fm" name="search_fm" >
                    <input class="sea_input" type="text" name="keyword" id="searchText" value="<?= Yii::$app->request->get('keyword', '请输入商品') ?>" />
                    <button type="submit" class="sea_submit">搜索</button>
                </form>
            </div>
            <div class="head_search_hot">
                <span>热搜榜：</span>
                <a class="red" href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => 'iPhone']) ?>" target="_blank">iPone</a>
                <a href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => '华为']) ?>">华为</a>
                <a href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => '三星']) ?>" target="_blank">三星</a>
                <a class="red" href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => '联想']) ?>">联想</a>
                <a href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => '荣耀']) ?>">荣耀</a>
                <a class="red" href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => 'Mate']) ?>" target="_blank">Mate</a>
            </div>
            <div class="intro">
                <ul>
                    <li class="no1"><a href="#" target="_blank"><h4>正品保证</h4><p>中国人保承保</p></a></li>
                    <li class="no2"><a href="#" target="_blank"><h4>7天退换货</h4><p>购物有保障</p></a></li>
                    <li class="no3"><a href="#"  target="_blank"><h4>满59就包邮</h4><p>闪电发货</p></a></li>
                </ul>
            </div>
        </div>
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
                    <a class="tit" href="<?= Yii::$app->urlManager->createUrl(['/cart']) ?>"><b class="iconfont">&#413;</b>去购物车结算<em class="num" id="hd_cartnum" <?php if ($totalNumber > 0) { ?>style="visibility: visible"<?php } ?>><?= $totalNumber ?></em></a>
                    <div class="list"><p class="load"></p></div>
                </div>
            </div>
        </div>
    </div>

    <?= $content ?>

    <div id="footer">
        <div class="ft-bg">
            <div class="ft_main">

                <div  class="ft_links">
                    <div class="ft_nav">
                        <a href="#" target="_blank" class="noborder" rel="nofollow">关于商城</a>
                        <a href="#" target="_blank">商城资讯</a>
                        <a href="#" target="_blank" rel="nofollow">商务合作</a>
                        <a href="#" target="_blank" rel="nofollow">加入我们</a>
                        <a href="#" target="_blank" rel="nofollow">配送政策</a>
                        <a href="#" target="_blank" rel="nofollow">售后保障</a>
                        <a href="#" target="_blank" rel="nofollow">帮助中心</a>
                        <a href="#" target="_blank">友情链接</a>
                        <a href="#" target="_blank" rel="nofollow">联系我们</a>
                    </div>
                    <div class="img_links">
                    </div>
                </div>
                <div class="ft_txt">
                    <p>
                        Copyright <?= date('Y') ?>, 深圳市华之腾技术有限公司 增值电信业务经营许可证：粤B2-20150326 备案号：<a href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow">粤ICP备15012845号-5</a></p>
                    <p class="ft_contact">
                        <span>服务时间：09:00-23:00</span> <span class="ft_phone">客服热线: <em>0755-36943966</em></span></p>
                    <p class="beian-logos">
                        <a href="#" target="_blank"><img alt="商城获得电商金典奖" src="/images/flogo-jindian.png" /></a>
                        <a href="#" target="_blank"><img alt="中国人保为商城化妆品承保" src="/images/flogo-picc.png" /></a>
                        <a href="#" target="_blank"><img alt="互联网协会A级信用认证" src="/images/flogo-xinyong.png" /></a>
                        <a href="#" target="_blank"><img alt="商城可信网站权威认证" src="/images/flogo-kexin.png" class="no-border" /></a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <?php $this->endBody() ?>
</body>
<?php
$js = <<<JS
jQuery("#favorite_wb").click(function(){
    var h = "http://www.yii2shop.com/",
    j = "我的商城 - 专注";
    try {
        window.external.addFavorite(h, j);
    } catch(i) {
        try {
            window.sidebar.addPanel(j, h, "");
        } catch(i) {
            alert("对不起，您的浏览器不支持此操作！请您使用菜单栏或Ctrl+D收藏丽子。");
        }
    }
});
jQuery("#main_nav").mouseenter(function(){
    jQuery(this).addClass('main_nav_hover');
    jQuery("#J_mainCata").css({"opacity":1,"height":95,"display":"block"})
});
jQuery("#main_nav").mouseleave(function(){
    jQuery(this).removeClass('main_nav_hover');
    jQuery("#J_mainCata").css({"opacity":0,"height":0,"display":"none"})
});
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
jQuery("#searchText").focus(function(){
    if (jQuery("#searchText").val() == '请输入商品')
    jQuery("#searchText").val('');
});
jQuery("#searchText").blur(function(){
    if (jQuery("#searchText").val() == '')
    jQuery("#searchText").val('请输入商品');
});
jQuery("#search_fm").submit(function(){
    if (jQuery("#searchText").val() == '请输入商品' || jQuery("#searchText").val() == '')
    return false;
});
JS;

$this->registerJs($js);
?>
</html>
<?php $this->endPage() ?>

