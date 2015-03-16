<?php
$this->title = Yii::t('app', 'My') . Yii::t('app', 'Favorite');
$this->params['breadcrumbs'][] = $this->title;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
$this->registerCssFile('@web/css/favorite.css', ['depends' => \frontend\assets\AppAsset::className()]);

?>

    <div class="trade_mod">
        <div class="my_nala_detail my_point">
            <h1><?= $this->title ?></h1>
            <div class="fav-list">
                <ul class="cle" id="fav-list">
                    <?php foreach ($products as $product) { ?>
                        <li>
                            <div class="bd">

                                <div class="pic"> <a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->id]) ?>" target="_blank"><img src="<?= $product->thumb ?>" alt=""></a> </div>
                                <p class="price"> <span class=""></span> <span class="">￥<b><?= $product->price ?></b></span></p>
                                <p class="name"><a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->id]) ?>" target="_blank"><?= $product->name ?></a></p>
                                <div class="btm">
                                    <span>
                                        <a href="javascript:;" data-link="<?= Yii::$app->urlManager->createUrl(['user/ajax-delete-favorite', 'id' => $product->id]) ?>" class="iconfont delete">删除</a>
                                        |<a href="javascript:;"  data-id="<?= $product->id ?>" class="iconfont addCart">加入购物车</a>
                                    </span>
                                </div>
                            </div>
                        </li>
                    <?php } ?>
                </ul>
            </div>
            <div class="pagination-right">
                <?php if (isset($pagination)) echo \yii\widgets\LinkPager::widget(['pagination' => $pagination]) ?>
            </div>
        </div>
    </div>

<?php
$urlCartAdd = Yii::$app->urlManager->createUrl(['cart/ajax-add']);
$this->registerJs('
var product = {csrf:"' . Yii::$app->request->getCsrfToken() . '"};
');

$js = <<<JS
jQuery(".delete").click(function(){
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            location.reload();
        }
    });
});
jQuery(".addCart").click(function(){
    var id = $(this).data('id');
    param = {
        productId : id,
        number : 1,
        _csrf : product.csrf
    };

    $.post("{$urlCartAdd}?id=" + id, param, function(data) {
        if (data.status > 0) {
            alert('成功添加到购物车');
        } else {
            alert('添加到购物车失败，可能由于库存不足或其他原因');
        }
    }, "json");
});
JS;

$this->registerJs($js);
