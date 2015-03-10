<?php
use yii\helpers\Html;
use yii\widgets\ListView;
use funson86\blog\Module;

//$this->title = Yii::$app->params['blogTitle'] . ' - ' . Yii::$app->params['blogTitleSeo'];
$this->params['breadcrumbs'][] = '帮助中心';

/*$this->breadcrumbs=[
    //$post->catalog->title => Yii::app()->createUrl('post/catalog', array('id'=>$post->catalog->id, 'surname'=>$post->catalog->surname)),
    '文章',
];*/

?>

<!--div class="info-banner page-banner clearfix">
    <img src="http://www.chexiu.cn/cache/images/case_banner.png">
</div-->



<div class="my_nala_detail my_address">
    <h1><?= $page->title ?></h1>
    <div class="detail_r">
        <div class="detail_r">
            <?= $page->content ?>
        </div>
    </div>
</div>
