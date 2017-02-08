<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

$this->registerCssFile('@web/css/login.css', ['depends' => \frontend\assets\AppAsset::className()]);

$this->title = Yii::t('app', 'Signup');
$this->params['breadcrumbs'][] = $this->title;
?>
<!--div class="site-signup">
    <h1><?= Html::encode($this->title) ?></h1>

    <p><?= Yii::t('app', 'Please fill out the following fields to signup:') ?></p>

    <div class="row">
        <div class="col-lg-5">
            <?php $form = ActiveForm::begin(['id' => 'form-signup']); ?>
                <?= $form->field($model, 'username') ?>
                <?= $form->field($model, 'email') ?>
                <?= $form->field($model, 'password')->passwordInput() ?>
                <div class="form-group">
                    <?= Html::submitButton(Yii::t('app', 'Signup'), ['class' => 'btn btn-primary', 'name' => 'signup-button']) ?>
                </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div-->

<div id="main" class="cle">
    <div class="box-pic" id="login-pic">
        <div class="img">
            <!-- cms: loginpage_pic -->
            <img src="/images/login-box-bg.jpg" width="500" height="450" /> </div>
    </div>
    <div class="g_box">
        <div id="login-box">
            <h2>
                <div class="trig">没有帐号？<a href="<?= Yii::$app->urlManager->createUrl(['site/login']) ?>" class="trigger-box">点击登录</a></div>
                注册
            </h2>
            <div class="form-bd-signup">
                <div class="form_box cle"  id="login-nala">
                    <div class="login_box">
                        <?php $form = ActiveForm::begin(['id' => 'login-nala-form']); ?>
                        <ul class="form">
                            <li class="text_input"><span class="error_icon"></span><span class="iconfont glyphicon glyphicon-user"></span>
                                <?= Html::activeTextInput($model, 'username', ['class' => 'text', 'placeholder' => "用户名"]) ?>
                            </li>
                            <li class="text_input"><span class="error_icon"></span><span class="iconfont glyphicon glyphicon-envelope"></span>
                                <?= Html::activeTextInput($model, 'email', ['class' => 'text', 'placeholder' => "邮箱"]) ?>
                            </li>
                            <li class="text_input"><span class="error_icon"></span><span class="iconfont glyphicon glyphicon-lock"></span>
                                <?= Html::activePasswordInput($model, 'password', ['class' => 'text', 'placeholder' => "密码"]) ?>
                            </li>
                            <div class="error_box" style="color:#F00"><em><?= Html::error($model, 'username'); ?><?= Html::error($model, 'email'); ?><?= Html::error($model, 'password'); ?></em></div>
                            <li class="lizi_law">
                                <label>
                                    <input type="checkbox" checked="checked" name="accept_lizi_law" tabindex="5">
                                    我已阅读并接受<a href="#" target="_blank">《商城服务协议》</a> </label>
                            </li>
                            <li class="last">
                                <?= Html::submitButton( Yii::t('app', 'Signup'), ['class' => 'btn', 'name' => 'login-button']) ?>
                            </li>
                        </ul>
                        <?php ActiveForm::end(); ?>
                    </div>
                </div>
            </div>
            <!--ul class="form other-form">
                <li>
                    <h5>使用第三方帐号登录</h5>
                </li>
                <li class="other-login"> <a class="sina" target="_blank" href="https://api.weibo.com/oauth2/authorize?client_id=1062800511&response_type=code&redirect_uri=http://www.mayicun.com/user/sinaLogin" onClick="ga('send','event','reg','click','sinaReg_');"></a> <a class="qq"  target="_blank" href="https://graph.qq.com/oauth2.0/authorize?response_type=code&amp;client_id=100224827&amp;state=1&amp;redirect_uri=www.mayicun.com/user/qqLoginCallback" onClick="ga('send','event','reg','click','qqReg_');"></a> <a class="alipay" target="_blank"  href="http://www.mayicun.com/user/alipayLogin" onClick="ga('send','event','reg','click','alipayReg_');"></a> <a class="taobao tb-link"target="_blank"  href="http://www.mayicun.com/user/taobaoLogin" onClick="ga('send','event','reg','click','taobaoReg_');"></a> <a class="baidu" target="_blank" href="http://www.mayicun.com/user/baiduLogin?login=baidu" onClick="ga('send','event','reg','click','baiduReg_');"></a> <a class="qihoo360" target="_blank" href="https://openapi.360.cn/oauth2/authorize?client_id=6550d4a07c17ee81e0737a4203d5848c&response_type=code&redirect_uri=http://www.mayicun.com/user/qihooCallBack&scope=basic&display=default" onClick="ga('send','event','reg','click','qihoo360Reg_');"></a> </li>
            </ul-->
        </div>
    </div>
</div>
