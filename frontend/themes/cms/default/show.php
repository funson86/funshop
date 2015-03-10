<?php
use yii\helpers\Html;
use yii\helpers\StringHelper;
?>

<div class="info-banner page-banner clearfix">
    <img src="http://www.chexiu.cn/cache/images/case_banner.png">
</div>

<div class="area column2">
    <div id="sidebar">
        <?= \funson86\cms\widgets\SideMenu::widget([
            'id' => $catalogId,
        ]) ?>
        <?= \funson86\cms\widgets\Contact::widget([
            'title' => '<i class="icon-st"></i>联系我们',
            'content' => 'contessssssss',
        ]) ?>
    </div>

    <div id="mainRight" class="showPage">
        <div class="title"><?= $show->title ?></div>
        <p class="date"><?= Yii::$app->formatter->asDate($show->created_at) ?></p>

        <div class="contentText">
            <?= $show->content; ?>
        </div>

    </div>

</div>

