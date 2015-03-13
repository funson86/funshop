<?php
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);

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
        <?= $this->render('@frontend/views/layouts/headerBar') ?>
        <?= $this->render('@frontend/views/layouts/headerSearch') ?>
        <?= $this->render('@frontend/views/layouts/headerNav') ?>
    </div>

    <div class="cle" id="wrapper">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <div class="my_nala_main">
            <div class="slidebar">
                <?= \yii\bootstrap\Nav::widget([
                    'options' => ['class' => 'sidebar'],
                    'items' => Yii::$app->params['mainMenu2']
                ]); ?>
            </div>
            <div class="my_nala_centre ilizi_centre">
                <?= $content ?>
            </div>
        </div>
    </div>

    <?= $this->render('@frontend/views/layouts/footer') ?>

    <?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

