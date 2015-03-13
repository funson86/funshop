<?php
use yii\helpers\Html;
use frontend\components\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
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
        <?= $this->render('headerBar') ?>
        <?= $this->render('headerSearch') ?>
        <?= $this->render('headerNav') ?>
    </div>

    <?= $content ?>

    <?= $this->render('footer') ?>

    <?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

