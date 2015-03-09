<?php
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\SiteAsset;
use frontend\widgets\Alert;

/* @var $this \yii\web\View */
/* @var $content string */

SiteAsset::register($this);
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

<div class="container">
    <?= Breadcrumbs::widget([
        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
    ]) ?>

    <?= $content ?>
</div>
<?= $this->render('footer') ?>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
