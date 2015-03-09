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
    <?= $this->render('header-bar') ?>
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
</div>

<?= $content ?>

<?= $this->render('footer') ?>

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
JS;

$this->registerJs($js);
?>
</html>
<?php $this->endPage() ?>
