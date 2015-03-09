<?php
/* @var $this yii\web\View */

$this->registerCssFile('@web/css/search.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>

<div id="wrapper">

<div class="main cle">

<?php if (!count($products)) { ?>
<div class="search-none">
    <div class="bd">
        <h4>很抱歉，没有找到与&nbsp;“<i class="red"><?= Yii::$app->request->get('keyword') ?></i>”&nbsp;相关的商品。你可以换一个关键词试试</h4>
        <p>1、看看输入的文字是否有误</p>
        <p>2、去掉可能不必要的字词，如“的”、“什么”等</p>
        <p>3、调整关键字，如“华为荣耀手机”改成“华为”或“荣耀”</p>
    </div>
    <div id="search-arrow" class="search-arrow"></div>
</div>
<?php } else { ?>
    <div class="search-selected"> <span class="search-min-nav"> <a href="<?= Yii::$app->urlManager->createUrl(['product/search']) ?>">全部</a> &gt; <a href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => Yii::$app->request->get('keyword')]) ?>"><?= Yii::$app->request->get('keyword') ?></a> </span> </div>
    <div class="productlist">
        <ul class="cle">
            <?php foreach ($products as $item) { ?>
            <li>
                <a class="productitem" target="_blank" href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $item->id]) ?>">
                    <span class="productimg"><img width="150" height="150" alt="<?= $item->name ?>" title="<?= $item->name ?>" style="display: block;" src="<?= $item->thumb ?>"> </span>
                    <span class="nalaprice">￥<b><?= $item->price ?></b> </span>
                    <span class="productname"><?= $item->name ?></span>
                    <?php if ($item->brief) { ?><span class="description"><?= $item->brief ?></span><?php } ?>
                    <span class="price">市场价：￥<?= $item->market_price ?></span>
                    <span class="salerow">销量：<span class="sales"><?= $item->sales ?></span>件</span>
                </a>
                <a rel="nofollow" target="_blank" class="addcart" href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $item->id]) ?>">加入购物车</a>
            </li>
            <?php } ?>
        </ul>
    </div>
    <div id="pagenav" class="pagenav">
        <?= \yii\widgets\LinkPager::widget(['pagination' => $pagination]) ?>
    </div>
<?php } ?>
</div>
</div>
