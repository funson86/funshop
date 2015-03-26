<?php
/* @var $this yii\web\View */

$this->registerCssFile('@web/css/category.css', ['depends' => \frontend\assets\AppAsset::className()]);

$arrayPath = \common\models\Category::getCatalogPath($model->id, $allCategory);
array_pop($arrayPath);
foreach ($arrayPath as $path) {
    $category = \common\models\Category::findOne($path);
    $this->params['breadcrumbs'][] = ['label' => $category->name, 'url' => ['/category/view', 'id' => $category->id]];
}
$this->params['breadcrumbs'][] = $model->name;
$rootId = \common\models\Category::getRootCatalogId($model->id, $allCategory);

$this->title = $model->name;
?>

<div id="wrapper">
<!-- main body -->
<?= \yii\widgets\Breadcrumbs::widget([
    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
    'options' => ['class' => 'here cle'],
    'tag' => 'div',
    'itemTemplate' => ' &gt; {link}',
    'activeItemTemplate' => ' &gt; {link}',
]) ?>

<div class="main cle">
<!-- left -->
<div class="sidebar">
    <div class="cate-menu" id="cate-menu">
        <h3><a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $rootId]) ?>"><strong><?= $arrayCategoryIdName[$rootId] ?></strong><i id="total_count"></i></a></h3>
        <dl>
            <?php foreach ($allCategory as $category) {
                if ($category['parent_id'] == $rootId) { ?>
                <dd <?php if ($model->id == $category['id']) { ?>class="current" <?php } ?>> <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $category['id']]) ?>"><?= $category['name'] ?><i class="sec_count">(<?= count(\common\models\Category::findOne($category['id'])->products) ?>)</i> </a> </dd>
            <?php }} ?>
        </dl>
    </div>
    <div class="right_box hot_items" id="cate-menu">
        <div class="hd">热销商品</div>
        <div class="bd">
            <ul class="cle">
                <?php foreach ($sameCategoryProducts as $item) { ?>
                    <li>
                        <span class="productimg">
                            <a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $item->id]) ?>" target="_blank">
                                <img width="150" height="150" title="<?= $item->name ?>" alt="<?= $item->name ?>" src="<?= $item->thumb ?>">
                            </a>
                        </span>
                        <span class="productname">
                            <a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $item->id]) ?>" target="_blank"><?= $item->name ?></a>
                        </span>
                        <span class="nalaprice">￥<b><?= $item->price ?></b></span>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>
<div class="maincon">
    <?php if ($priceFilter) { $span = $priceFilter['span']; ?>
    <div class="search-options" id="search-options">
        <div class="bd">
            <?php if (count($brandFilter)) { ?>
            <dl>
                <dt>品牌：</dt>
                <dd>
                    <div class="items cle">
                        <?php foreach ($brandFilter as $item) { ?>
                        <div class="link"> <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $model->id, 'brand_id' => $item->id]) ?>" class="item" ><?= $item->name ?></a> </div>
                        <?php } ?>
                    </div>
                    <a class="more-btn" href="javascript:;">更多</a> </dd>
            </dl>
            <?php } ?>
            <dl>
                <dt>价格：</dt>
                <dd class="dd-price">
                    <div class="items cle">
                        <?php for ($i = $priceFilter['start']; $i < $priceFilter['end']; $i += $span) { ?>
                        <div class="link"> <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $model->id, 'min' => $i, 'max' => $i + $span]) ?>" class="item" ><?= $i . ' - ' . ($i + $span) ?></a> </div>
                        <?php } ?>
                    </div>
                    <div class="priceform" id="priceform">
                        <div class="form-bg">
                            <form action="" method="post" id="freepriceform">
                                <span class="rmb"></span>
                                <input type="text" value="" name="pricemin" id="pricemin"/>
                                <span class="rmb rmb2"></span>
                                <input type="text" value="" name="pricemax" id="pricemax"/>
                                <p>
                                    <input type="submit" value="确定" class="submit"/>
                                </p>
                            </form>
                        </div>
                    </div>
                </dd>
            </dl>
        </div>
    </div>
    <?php } ?>
    <div class="productlist">
        <ul class="cle">
            <?php if (count($products)) { foreach ($products as $product) { ?>
                <li>
                    <a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->id]) ?>" target="_blank" class="productitem">
                        <span class="productimg">
                            <img src="<?= $product->thumb ?>" width="150" height="150" title="<?= $product->name ?>" alt="<?= $product->name ?>" />
                        </span>
                        <span class="nalaprice">￥<b><?= $product->price ?></b> </span>
                        <span class="productname"><?= $product->name ?></span>
                        <?php if ($product->brief) { ?><span class="description"><?= $product->brief ?></span><?php } ?>
                        <span class="price"> 专柜价：￥<?= $product->price ?> </span>
                        <span class="salerow"> 销量：<span class="sales"><?= $product->sales ?></span>件 </span>
                    </a>
                </li>
            <?php }} else { ?>
                <li>很抱歉，没有找到相关的商品</li>
            <?php } ?>
        </ul>
        <br clear="all" />
    </div>
    <div class="pagination-right">
        <?= \yii\widgets\LinkPager::widget(['pagination' => $pagination]) ?>
    </div>
</div>
</div>
</div>
<?php
$js = <<<JS

$(".submit").click(function(){
    if (parseInt($("#pricemin").val()) < 0 || parseInt($("#pricemax").val()) < 0) {
        alert("请输入正确的价格区间");
    } else {
        location.href = "?min=" + parseInt($("#pricemin").val()) + '&max=' + parseInt($("#pricemax").val());
    }
    return false;
});

JS;

$this->registerJs($js);
?>
