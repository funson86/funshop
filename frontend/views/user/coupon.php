<?php
$this->title = Yii::t('app', 'My') . Yii::t('app', 'Coupon');
$this->params['breadcrumbs'][] = $this->title;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>

<style>
td img {
    width: 40px;
    height: 40px;
}
</style>

    <div class="my_nala_detail">
        <h1><?= $this->title ?> <span><a href="<?= Yii::$app->urlManager->createUrl(['user/coupon', 'type' => 1]) ?>">未使用</a></span> <span><a href="<?= Yii::$app->urlManager->createUrl(['user/coupon', 'type' => 2]) ?>">已使用</a></span> <span><a href="<?= Yii::$app->urlManager->createUrl(['user/coupon', 'type' => 3]) ?>">已过期</a></span></h1>
        <div class="detail_r">
            <table id="address_list" class="admin_table">
                <tbody>
                <tr>
                    <th>面值</th>
                    <th>所需消费金额</th>
                    <th>编码</th>
                    <th>有效期</th>
                    <th>发送时间</th>
                </tr>
                <?php foreach ($models as $item) { ?>
                    <tr>
                        <td>￥<?= $item->money ?></td>
                        <td>￥<?= $item->min_amount ?></td>
                        <td><?= $item->sn ? $item->sn : $item->id ?></td>
                        <td><?= Yii::$app->formatter->asDate($item->started_at) ?> 到 <?= Yii::$app->formatter->asDate($item->ended_at) ?></td>
                        <td><?= Yii::$app->formatter->asDate($item->created_at) ?></td>
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

?>