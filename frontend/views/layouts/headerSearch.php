<div class="hd_main cle">
    <div class="logo">
        <p>
            <a href="<?= Yii::$app->homeUrl ?>" class="lizi_logo">商城</a>
        </p>
    </div>
    <div class="search_box">
        <form action="<?= Yii::$app->urlManager->createUrl(['product/search']) ?>" method="get" id="search_fm" name="search_fm" >
            <input class="sea_input" type="text" name="keyword" id="searchText" value="<?= Yii::$app->request->get('keyword', '请输入商品') ?>" />
            <button type="submit" class="sea_submit">搜索</button>
        </form>
    </div>
    <div class="head_search_hot">
        <span>热搜榜：</span>
        <a class="red" href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => 'iPhone']) ?>" target="_blank">iPone</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => '华为']) ?>">华为</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => '三星']) ?>" target="_blank">三星</a>
        <a class="red" href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => '联想']) ?>">联想</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => '荣耀']) ?>">荣耀</a>
        <a class="red" href="<?= Yii::$app->urlManager->createUrl(['product/search', 'keyword' => 'Mate']) ?>" target="_blank">Mate</a>
    </div>
    <div class="intro">
        <ul>
            <li class="no1"><a href="#" target="_blank"><h4>正品保证</h4><p>中国人保承保</p></a></li>
            <li class="no2"><a href="#" target="_blank"><h4>7天退换货</h4><p>购物有保障</p></a></li>
            <li class="no3"><a href="#"  target="_blank"><h4>满59就包邮</h4><p>闪电发货</p></a></li>
        </ul>
    </div>
</div>

<?php
$js = <<<JS
jQuery("#searchText").focus(function(){
    if (jQuery("#searchText").val() == '请输入商品')
        jQuery("#searchText").val('');
});
jQuery("#searchText").blur(function(){
    if (jQuery("#searchText").val() == '')
        jQuery("#searchText").val('请输入商品');
});
jQuery("#search_fm").submit(function(){
    if (jQuery("#searchText").val() == '请输入商品' || jQuery("#searchText").val() == '')
        return false;
});
JS;

$this->registerJs($js);
?>
