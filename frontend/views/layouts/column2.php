<?php
use yii\bootstrap\Nav;
use yii\widgets\Breadcrumbs;
$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);
$this->beginContent('@frontend/views/layouts/main.php');
?>
<div class="cle" id="wrapper">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
    <div class="my_nala_main">
        <div class="slidebar">
            <?php
            $menuItems = [
                [
                    'label' => Yii::t('app', 'My Shop'),
                    'url' => ['user/index'],
                    'options' => ['class' => 'sidebar-header']
                ],
                [
                    'label' => Yii::t('app', 'Order Center'),
                    'url' => '#',
                    'active' => false,
                    'items' => [
                        ['label' => Yii::t('app', 'My') . Yii::t('app', 'Order'), 'url' => ['/order/index']],
                        ['label' => Yii::t('app', 'Product Comment'), 'url' => ['/comment/index']],
                    ],
                    'options' => ['class' => 'root-item'],
                ],
                [
                    'label' => Yii::t('app', 'Product Center'),
                    'url' => '#',
                    'active' => false,
                    'items' => [
                        ['label' => Yii::t('app', 'My') . Yii::t('app', 'Favorite'), 'url' => ['/user/favorite']],
                        ['label' => Yii::t('app', 'Consultation') , 'url' => ['/consultation/index']],
                    ],
                    'options' => ['class' => 'root-item'],
                ],
                [
                    'label' => Yii::t('app', 'User Center'),
                    'url' => '#',
                    'active' => false,
                    'items' => [
                        ['label' => Yii::t('app', 'My') . Yii::t('app', 'Address'), 'url' => ['/address/index']],
                        ['label' => Yii::t('app', 'My') . Yii::t('app', 'Point'), 'url' => ['/user/point-log']],
                        ['label' => Yii::t('app', 'My') . Yii::t('app', 'Coupon'), 'url' => ['/user/coupon']],
                        ['label' => Yii::t('app', 'My Profile'), 'url' => ['/user/profile']],
                        ['label' => Yii::t('app', 'Security'), 'url' => ['/user/change-password']],
                    ],
                    'options' => ['class' => 'root-item'],
                ],

            ];
            echo Nav::widget([
                'options' => ['class' => 'sidebar'],
                'items' => $menuItems,
            ]);
            ?>
        </div>
        <div class="my_nala_centre ilizi_centre">
            <?= $content ?>
        </div>
    </div>
</div>
<?php
$this->endContent();
?>