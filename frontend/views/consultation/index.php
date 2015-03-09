<?php
$this->title = Yii::t('app', 'Consultation');
$this->params['breadcrumbs'][] = $this->title;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>

<style>
td img{
    width: 40px;
    height: 40px;
}
</style>

    <div class="my_nala_detail">
        <h1><?= $this->title ?></h1>
        <div class="detail_r">
            <table id="address_list" class="admin_table">
                <tbody>
                <tr>
                    <th width="60">咨询商品</th>
                    <th width="60">商品名称</th>
                    <th>咨询回复</th>
                    <th width="120">&nbsp;</th>
                </tr>
                <?php
                foreach ($models as $item) {
                    $product = \common\models\Product::findOne($item->product_id);
                    ?>
                    <tr>
                        <td rowspan="2"><img src="<?= $product->thumb ?>"></td>
                        <td rowspan="2"><a target="_blank" href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->id]) ?>"><?= $product->name ?> </a></td>
                        <td style="text-align:left"><?= $item->question ?></td>
                        <td><?= Yii::$app->formatter->asDatetime($item->created_at) ?></td>
                    </tr>
                    <tr>
                        <td style="text-align:left"><?= $item->answer ? '回复：' . $item->answer : '(尚未回复)'?></td>
                        <td><?= Yii::$app->formatter->asDatetime($item->updated_at) ?></td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
            <div class="pagination-right">
                <?= \yii\widgets\LinkPager::widget(['pagination' => $pagination]) ?>
            </div>
        </div>
    </div>
