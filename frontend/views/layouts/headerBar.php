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
            <li><a class="menu-link" href="<?= Yii::$app->urlManager->createUrl(['/cms/default/page', 'id' => 11, 'surname' => 'register']) ?>">帮助中心</a></li>
        </ul>
    </div>
</div>

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

JS;
$this->registerJs($js);
?>