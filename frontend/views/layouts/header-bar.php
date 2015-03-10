<div class="hd_bar">
    <div class="bd_bar_bd cle cart_width">
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
            <li><a class="menu-link" href="<?= Yii::$app->urlManager->createUrl(['/cms/default/page?id=6']) ?>">帮助中心</a></li>
        </ul>
    </div>
</div>
