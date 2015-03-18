<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);

$this->title = Yii::t('app', 'Security');
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
                        <?= Yii::t('app', 'Please fill out the following fields to change password') ?>
                    </li>
                    <li>
                        <label>当前密码:</label>
                        <?= Html::activePasswordInput($model, 'oldpassword', ['class' => 'txt']) ?>
                    </li>
                    <li>
                        <label>新密码:</label>
                        <?= Html::activePasswordInput($model, 'password', ['class' => 'txt']) ?>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <?= Html::activePasswordInput($model, 'repassword', ['class' => 'txt']) ?>
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
