<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Region;

$this->title = Yii::t('app', 'My') . Yii::t('app', 'Address');
$this->params['breadcrumbs'][] = $this->title;

$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>
<style>
.form button.btn {
    width: 108px;
    height: 38px;
}
</style>

<div class="my_nala_detail my_address">
    <h1><?= $this->title ?></h1>
    <div class="detail_r">
        <?php $form = ActiveForm::begin(['id' => '']); ?>
        <?= Html::activeHiddenInput($model, 'user_id', ['value' => Yii::$app->user->id]) ?>
        <div class="form-bd" id="first-addr-form">
            <ul class="form addr-form" id="addr-form">
                <li>
                    <label class="nobg">地址标注:</label>
                    <span class="flag-default"><?= Html::activeTextInput($model, 'name', ['class' => 'txt']) ?></span>
                </li>
                <li>
                    <label>收货姓名:</label>
                    <?= Html::activeTextInput($model, 'consignee', ['class' => 'txt']) ?>
                </li>
                <li class="addr-li cle">
                    <label>国家:</label>
                    <?php
                    echo Html::activeDropDownList($model, 'country', ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => 0])->all(), 'id', 'name'), [
                        'prompt'=> Yii::t('app','Please Select'),
                        'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#address-province" ).html( data );
                            });',
                    ]);

                    echo Html::activeDropDownList($model, 'province',
                        $model->province ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->country])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')],
                        [
                            'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#address-city" ).html( data );
                            });'
                        ]);

                    echo Html::activeDropDownList($model, 'city',
                        $model->city ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->province])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')],
                        [
                            'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#address-district" ).html( data );
                            });'
                        ]);

                    echo Html::activeDropDownList($model, 'district', $model->district ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->city])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')]);
                    ?>
                <li>
                    <label>街道地址:</label>
                    <?= Html::activeTextInput($model, 'address', ['class' => 'txt']) ?>
                </li>
                <li>
                    <label>邮编:</label>
                    <?= Html::activeTextInput($model, 'zipcode', ['class' => 'txt']) ?>
                </li>
                <li>
                    <label>联系电话:</label>
                    <?= Html::activeTextInput($model, 'mobile', ['class' => 'txt']) ?>
                    <span class="info">推荐手机，座机需加区号和“-”符号</span></li>
                <li class="last"><?= Html::submitButton( Yii::t('app', '提交'), ['class' => 'btn',]) ?><a href="<?= Yii::$app->request->referrer ?>" hidefocus="true" class="btn">返 回</a></li>
            </ul>
        </div>
        <?php ActiveForm::end(); ?>
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
JS;

$this->registerJs($js);
?>
