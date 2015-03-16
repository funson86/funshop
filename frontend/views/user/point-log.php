<?php
$this->title = Yii::t('app', 'My') . Yii::t('app', 'Point Log');
$this->params['breadcrumbs'][] = $this->title;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
$this->registerCssFile('@web/css/comment.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>

<style>
td img {
    width: 40px;
    height: 40px;
}
</style>

    <div class="my_nala_detail">
        <h1><?= $this->title ?></h1>
        <div class="detail_r">
            <p style="height: 30px;">当前积分为： <span> <?= Yii::$app->user->identity->point ?> </span> 分，  100积分可抵现金1元， <a href="#">点击查看详情</a> </p>
            <table id="address_list" class="admin_table">
                <tbody>
                <tr>
                    <th>时间</th>
                    <th>积分情况</th>
                    <th>类型</th>
                    <th>备注</th>
                    <th>积分余额</th>
                </tr>
                <?php foreach ($models as $item) { ?>
                    <tr>
                        <td><?= Yii::$app->formatter->asDate($item->created_at) ?></td>
                        <td><?= $item->point > 0 ? '+' . $item->point : $item->point ?></td>
                        <td><?= \common\models\PointLog::getTypeLabels($item->type) ?></td>
                        <td><?= $item->remark ?></td>
                        <td><?= $item->balance ?></td>
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