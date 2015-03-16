<?php
use common\models\Region;
$this->title = Yii::t('app', 'My') . Yii::t('app', 'Address');
$this->params['breadcrumbs'][] = $this->title;

$this->title = 'Addresses';
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>

    <div class="my_nala_detail my_address">
        <h1><?= $this->title ?></h1>
        <div class="detail_r">
            <h2><a class="fr" id="add_newaddr" href="<?= Yii::$app->urlManager->createUrl('address/create') ?>"><i>+</i>新增收货地址</a>我的收货地址簿</h2>
            <table id="address_list" class="admin_table">
                <tbody>
                <tr>
                    <th width="60">默认地址</th>
                    <th width="60">收货人</th>
                    <th>所在区域</th>
                    <th>街道地址</th>
                    <th width="85">联系电话</th>
                    <th width="90">操作</th>
                </tr>
                <?php foreach ($models as $item) { ?>
                    <tr>
                        <td><a class="default <?php if ($item->default) { ?>current <?php } ?>" href="javascript:;" data-link="<?= Yii::$app->urlManager->createUrl(['address/default', 'id' => $item->id]) ?>"><i class="glyphicon glyphicon-map-marker"></i></a></td>
                        <td><?= $item->consignee ?></td>
                        <td><?= $item->country ? Region::findOne($item->country)->name : '' ?> <?= $item->province ? Region::findOne($item->province)->name : '' ?> <?= $item->city ? Region::findOne($item->city)->name : '' ?> <?= $item->district ? Region::findOne($item->district)->name : '' ?></td>
                        <td><?= $item->address ?></td>
                        <td><?= $item->mobile ?></td>
                        <td class="setup"><a class="update" href="<?= Yii::$app->urlManager->createUrl(['address/update', 'id' => $item->id]) ?>">修改</a>&nbsp;|&nbsp;<a class="delete" href="<?= Yii::$app->urlManager->createUrl(['address/delete', 'id' => $item->id]) ?>" data-confirm="<?= Yii::t('cms', 'Are you sure you want to delete this item?');?>">删除</a></td>
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
jQuery(".delete").click(function(){
    var message = $(this).data('confirm');
    if (message !== undefined) {
        if (confirm(message)) {
            $.get($(this).href, function(data, status) {
                if (status == "success") {
                    location.reload()
                }
            });
        }
    }
});
jQuery(".default").click(function(){
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            location.reload()
        }
    });
});
JS;

$this->registerJs($js);
