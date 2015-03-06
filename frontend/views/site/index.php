<?php
/* @var $this yii\web\View */
$this->title = 'Funshop';
$this->registerCssFile('@web/css/index.css', ['depends' => \frontend\assets\AppAsset::className()]);
$this->registerJsFile('@web/js/switchable.js', ['depends' => \frontend\assets\AppAsset::className()]);
?>


<div class="index-banner">
    <div class="index-slide" id="index-slide">
        <ul>
            <li data-img="/images/banner1.jpg">
                <a href="#" title=""></a>
            </li>
            <li data-img="/images/banner2.jpg">
                <a href="#" title=""></a>
            </li>
            <li data-img="/images/banner3.jpg">
                <a href="#" title=""></a>
            </li>
            <li data-img="/images/banner4.jpg">
                <a href="#" title=""></a>
            </li>
            <li data-img="/images/banner1.jpg">
                <a href="#" title=""></a>
            </li>
            <li data-img="/images/banner2.jpg">
                <a href="#" title=""></a>
            </li>
            <li data-img="/images/banner3.jpg">
                <a href="#" title=""></a>
            </li>
            <li data-img="/images/banner4.jpg">
                <a href="#" title=""></a>
            </li>
        </ul>

        <div class="trigger-box">&nbsp;</div>
    </div>
</div>

<!-- 类目推荐 -->
<div class="series_list">
<div class="series_box cle">
    <div class="series_info">
        <div class="series_name name_product">
            <h2>手机</h2>
        </div>
        <ul class="brand">
            <li> <a href="#" target="_blank"> <img src="/upload/201502/small-iphone61.jpg"></a> </li>
            <li> <a href="#" target="_blank"> <img src="/upload/201502/small-macbook.jpg"></a> </li>
            <li> <a href="#" target="_blank"> <img src="/upload/201502/small-sumsung.jpg"></a> </li>
        </ul>
        <div class="brand_cata">
            <a target="_blank" href="http://www.mayicun.com/item/0103/">苹果</a>
            <a target="_blank" href="http://www.mayicun.com/item/0107/">三星</a>
            <a target="_blank" href="http://www.mayicun.com/item/0116/">华为</a>
        </div>
    </div>
    <div class="series_pic"> <a href="#" target="_blank"> <img src="/upload/201502/small-iphone6.jpg"></a> </div>
    <div class="pro_list">
        <ul class="cle">
            <?php foreach ($products as $item) { ?>
            <li>
                <a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $item->id]) ?>" target="_blank">
                    <p class="pic"> <img src="<?= $item->thumb ?>"></p>
                    <h3><?= $item->name ?></h3>
                    <p class="price">￥<?= $item->price ?></p>
                </a>
            </li>
            <?php } ?>
        </ul>
    </div>
</div>

</div>

<?php
$js = <<<JS
if ($("#index-slide").find("li").length == 1) {
    $("#index-slide").find(".trigger-box").hide();
}
a(0);
$('#index-slide').switchable({
    triggers: $('#index-slide').find(".trigger-box"),
    panels: "li",
    effect: "fade",
    interval: 5,
    autoplay: true,
    beforeSwitch: function(f, d) {
        a(d);
    }
});
function a(e) {
    var f = $('#index-slide').find("li").eq(e),
            d = f.data("img");
    if (d != "none" && d != undefined) {
        f.css("background-image", "url(" + d + ")").data("img", "none");
    }
}
JS;

$this->registerJs($js);
?>