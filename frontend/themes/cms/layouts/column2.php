<?php
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use funson86\cms\assets\AppAsset;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="language" content="en" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="Robots" Content="All">
    <meta name="googlebot" content="All">
    <meta name="keywords" content="<?//= Html::encode($this->seoKeywords) ?>" />
    <meta name="description" content="<?//= Html::encode($this->seoDescription) ?>" />
    <meta name="author" content="funson86" />
    <meta name="Copyright" content="yii2-cms" />

    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
<div class="container" id="page">
    <div id="header">
        <div id="logo"><?= Html::a(Yii::$app->setting->get('siteName'), Yii::$app->homeUrl) ?></div>
        <div id="mainMenu">
            <?= Nav::widget(['items' => Yii::$app->params['mainMenu']]); ?>
        </div>
        <div class="clear"></div>
    </div><!-- header -->

    <div id="content">
        <?php echo $content; ?>
    </div>

</div>

<div id="footer">
    <div class="footerContent">
        <?= Yii::$app->setting->get('siteName') ?>
    </div>
</div><!-- footer -->
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
