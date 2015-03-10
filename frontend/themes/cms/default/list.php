<?php
use yii\helpers\Html;
use yii\widgets\ListView;
use funson86\cms\Module;

//$this->title = Yii::$app->params['blogTitle'] . ' - ' . Yii::$app->params['blogTitleSeo'];
$this->params['breadcrumbs'][] = '文章';

/*$this->breadcrumbs=[
    //$post->catalog->title => Yii::app()->createUrl('post/catalog', array('id'=>$post->catalog->id, 'surname'=>$post->catalog->surname)),
    '文章',
];*/

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

    <div id="mainRight" class="listPage">
        <div class="title"><strong><?= $list->title ?></strong></div>

        <ul>
            <?php foreach ($shows as $show) {
                echo Html::tag('li', Html::a($show->title, Yii::$app->urlManager->createUrl(['cms/default/show', 'id' => $show->id])) . Html::tag('span', Yii::$app->formatter->asDate($show->created_at)). '<div class="clear"></div>', ['class' => 'clearfix']);
            }
            ?>
        </ul>

        <?= \yii\widgets\LinkPager::widget(['pagination' => $pagination]) ?>
    </div>

</div>


