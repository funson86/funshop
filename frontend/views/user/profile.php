<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use common\models\Profile;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);

$this->title = Yii::t('app', 'My Profile');
$this->params['breadcrumbs'][] = $this->title;

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
        <div class="detail_r">
            <?php $form = ActiveForm::begin(['id' => '']); ?>
            <?= Html::activeHiddenInput($model, 'user_id', ['value' => Yii::$app->user->id]) ?>
            <div class="form-bd" id="first-addr-form">
                <ul class="form addr-form" id="addr-form">
                    <li>
                        <label>帐号:</label>
                        <?= Yii::$app->user->identity->username ?>
                    </li>
                    <li>
                        <label>邮箱:</label>
                        <?= Yii::$app->user->identity->email ?>
                    </li>
                    <!--li>
                        <label>头像:</label>
                        <?= Yii::$app->user->identity->email ?>
                    </li-->
                    <li>
                        <label>昵称:</label>
                        <?= Html::activePasswordInput($model, 'surname', ['class' => 'txt']) ?>
                    </li>
                    <li>
                        <label>性别:</label>
                        <?= Html::activeRadioList($model, 'sex', [1 => '男', 2 => '女'], ['tag' => 'span']) ?>
                    </li>
                    <li>
                        <label>生日:</label>
                        <?= Html::activeDropDownList($model, 'year', Profile::getYears(), ['prompt' => '--年--']) ?>
                        <?= Html::activeDropDownList($model, 'month', Profile::getMonths(), ['prompt' => '--月--']) ?>
                        <?= Html::activeDropDownList($model, 'day', Profile::getDays(), ['prompt' => '--日--']) ?>
                    </li>
                    <li>
                        <label>地区:</label>
                        <?php
                        echo Html::activeDropDownList($model, 'country', ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => 0])->all(), 'id', 'name'), [
                            'prompt'=> Yii::t('app','Please Select'),
                            'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#profile-province" ).html( data );
                            });',
                        ]);
                        echo '&nbsp;&nbsp;&nbsp;&nbsp;';
                        echo Html::activeDropDownList($model, 'province',
                            $model->province ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->country])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')],
                            [
                                'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#profile-city" ).html( data );
                            });'
                            ]);
                        echo '&nbsp;&nbsp;&nbsp;&nbsp;';
                        echo Html::activeDropDownList($model, 'city',
                            $model->city ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->province])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')],
                            [
                                'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#profile-district" ).html( data );
                            });'
                            ]);
                        echo '&nbsp;&nbsp;&nbsp;&nbsp;';
                        echo Html::activeDropDownList($model, 'district', $model->district ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->city])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')]);
                        ?>
                    </li>
                    <li>
                        <?= Yii::$app->getSession()->getFlash('success') ?><?= Html::error($model, 'oldpassword'); ?><?= Html::error($model, 'password'); ?><?= Html::error($model, 'repassword'); ?>
                    </li>
                    <li class="last"><?= Html::submitButton( Yii::t('app', 'Submit'), ['class' => 'btn',]) ?><a href="<?= Yii::$app->request->referrer ?>" hidefocus="true" class="btn">返 回</a></li>
                </ul>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
