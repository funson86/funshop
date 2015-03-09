<?php
$this->title = Yii::t('app', 'Product Comment');
$this->params['breadcrumbs'][] = $this->title;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
$this->registerCssFile('@web/css/comment.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>

<style>
td img{
    width: 40px;
    height: 40px;
}
</style>
    <div class="my_nala_detail">
        <h1><?= $this->title ?> <span><a href="<?= Yii::$app->urlManager->createUrl(['comment/index']) ?>">待评价</a></span> <span><a href="<?= Yii::$app->urlManager->createUrl(['comment/commented']) ?>">已评价</a></span></h1>
        <div class="detail_r">
            <table id="address_list" class="admin_table">
                <tbody>
                <tr>
                    <th>商品预览</th>
                    <th>商品名称</th>
                    <th>购买时间</th>
                    <th width="120">评价状态</th>
                </tr>
                <?php
                foreach ($models as $item) {
                    $product = \common\models\Product::findOne($item->product_id);
                    ?>
                    <tr>
                        <td><img src="<?= $product->thumb ?>"></td>
                        <td><a target="_blank" href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->id]) ?>"><?= $product->name ?> </a></td>
                        <td><?= Yii::$app->formatter->asDate($item->created_at) ?></td>
                        <td><a title="发评价拿积分" href="javascript:;" class="addComment">发表评价<b class="icon-show"></b></a></td>
                    </tr>
                    <tr style="display:none">
                        <td colspan="4">
                            <form class="form">
                                <div style="width: 100%" class="form comment-box">
                                    <div class="item"><span class="label"><em>*</em>评分：</span>
                                        <div class="fl">
                                                <span class="commstar">
                                                    <a data-value="1" class="star1" href="javascript:;"></a>
                                                    <a data-value="2" class="star2" href="javascript:;"></a>
                                                    <a data-value="3" class="star3" href="javascript:;"></a>
                                                    <a data-value="4" class="star4" href="javascript:;"></a>
                                                    <a data-value="5" class="star5" href="javascript:;"></a>
                                                </span>
                                            <input type="hidden" class="commentStar">
                                            <div class="clr"></div>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                    <div class="item item01 xindeEl">
                                        <span class="label"><em>*</em>心得：</span>
                                        <div class="cont">
                                            <textarea class="area area01 commentContent" rows="" cols="" name="">商品是否给力？快分享你的购买心得吧~</textarea>
                                            <div class="clr"></div>
                                            <span class="msg-error-01 hide">麻烦填写10-500个字呦</span>
                                            <div class="msg-text ftx-03">10-500字</div>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                    <div class="item item02">
                                        <span class="label">&nbsp;</span>
                                        <div class="fl">
                                            <a class="btn btn-5 mr20 createComment" href="javascript:;" data-link="<?= Yii::$app->urlManager->createUrl(['comment/ajax-add', 'product_id' => $product->id, 'order_id' => $item->order_id]) ?>">
                                                <s></s>
                                                <span class="pingjiaEl">评价并继续</span>
                                            </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="checkbox" name="thirdShare" id="anonymousFlag" checked="checked" class="jdcheckbox">
                                            <label title="匿名评价不会展示您的用户昵称，该评价也不会被第三方网站应用" class="anon-l" for="anonymousFlag">匿名评价<span class="sign-icon"></span></label>
                                            <div class="msg-text"></div>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                </div>
                            </form>
                        </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
            <div class="pagination-right">
                <?= \yii\widgets\LinkPager::widget(['pagination' => $pagination]) ?>
            </div>
        </div>
    </div>


<?php
$this->registerJs('
var product = {csrf:"' . Yii::$app->request->getCsrfToken() . '"};
');

$js = <<<JS
jQuery(".addComment").click(function(){
    var link = $(this).data('link');
    var formComment = $(this).parents('tr').next();
    if (formComment.css('display') == 'none') {
        formComment.css('display', 'table-row');
    } else {
        formComment.css('display', 'none');
    }
});
jQuery(".commstar a").click(function(){
    jQuery(".commstar a").removeClass('active');
    $(this).addClass('active');
    $(this).parents().next().val($(this).data('value'));
});

jQuery(".commentContent").click(function(){
    if ($(this).val() == '商品是否给力？快分享你的购买心得吧~')
        $(this).val('');
});

jQuery(".createComment").click(function(){
    var link = $(this).data('link');
    var star = $(this).parents('form').find('.commentStar').val();
    var content = $(this).parents('form').find('.commentContent').val();
    if (star < 1 || star > 5) {
        alert("请对该商品评分");
        return false;
    }

    if (content.length < 10 ) {
        alert("心得最少10个字符，请补充");
        return false;
    }

    $.get(link + '&star=' + star + '&content=' + content, function(data, status) {
        if (status == "success") {
            alert("评价发表成功，积分随后发送到您的账户中，感谢您的评价");
            location.reload()
        }
    });
});
JS;

$this->registerJs($js);
