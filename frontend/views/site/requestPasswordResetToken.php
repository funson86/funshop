<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\PasswordResetRequestForm */

$this->registerCssFile('@web/css/login.css', ['depends' => \frontend\assets\AppAsset::className()]);

$this->title = Yii::t('app', 'Request password reset');
$this->params['breadcrumbs'][] = $this->title;
?>


<div id="main" class="cle">
    <div class="box-pic" id="login-pic">
        <div class="img">
            <!-- cms: loginpage_pic -->
            <img src="/images/login-box-bg.jpg" width="500" height="450" /> </div>
    </div>
    <div class="g_box">
        <div id="login-box">
            <h2>
                <div class="trig"><a href="<?= Yii::$app->urlManager->createUrl(['site/login']) ?>" class="trigger-box">点击登录</a></div>
                找回密码
            </h2>
            <div class="form-bd-signup">
                <div class="form_box cle"  id="login-nala">
                    <div class="login_box">
                        <?php $form = ActiveForm::begin(['id' => 'login-nala-form']); ?>
                        <ul class="form">
                            <li>
                                <?= Yii::t('app', 'Please fill out your email. A link to reset password will be sent there.') ?>
                            </li>
                            <li class="text_input"><span class="error_icon"></span><span class="iconfont glyphicon glyphicon-envelope"></span>
                                <?= Html::activeTextInput($model, 'email', ['class' => 'text', 'placeholder' => "邮箱"]) ?>
                            </li>
                            <div class="error_box" style="color:#F00"><?= Html::error($model, 'email'); ?><?= Yii::$app->session->getFlash('success') ?></em></div>
                            <li class="last">
                                <?= Html::submitButton( Yii::t('app', 'Send'), ['class' => 'btn', 'name' => 'login-button']) ?>
                            </li>
                        </ul>
                        <?php ActiveForm::end(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
