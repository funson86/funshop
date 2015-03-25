<?php
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;

NavBar::begin([
    'brandLabel' => 'Funshop',
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar-inverse navbar-fixed-top',
    ],
]);
$menuItemsMain = [
    [
        'label' => Yii::t('app', 'Order'),
        'url' => ['#'],
        'active' => false,
        'items' => [
            [
                'label' => Yii::t('app', 'Order'),
                'url' => ['/order'],
            ],
            [
                'label' => Yii::t('app', 'Order Log'),
                'url' => ['/order-log'],
            ],
            [
                'label' => Yii::t('app', 'Cart'),
                'url' => ['/cart'],
            ],
        ],
        //'visible' => Yii::$app->user->can('readPost'),
    ],
    [
        'label' => Yii::t('app', 'Product'),
        'url' => ['#'],
        'active' => false,
        'items' => [
            [
                'label' => Yii::t('app', 'Category'),
                'url' => ['/category'],
            ],
            [
                'label' => Yii::t('app', 'Product'),
                'url' => ['/product'],
            ],
            [
                'label' => Yii::t('app', 'Comment'),
                'url' => ['/comment'],
            ],
            [
                'label' => Yii::t('app', 'Consultation'),
                'url' => ['/consultation'],
            ],
            [
                'label' => Yii::t('app', 'Brand'),
                'url' => ['/brand'],
            ],
            [
                'label' => Yii::t('app', 'Search Log'),
                'url' => ['/search-log'],
            ],
            [
                'label' => Yii::t('app', 'Import'),
                'url' => ['/product/import'],
            ],
            [
                'label' => Yii::t('app', 'Export'),
                'url' => ['/product/export'],
            ],
        ],
        //'visible' => Yii::$app->user->can('readPost'),
    ],
    [
        'label' => '<i class="fa fa-cog"></i> ' . Yii::t('app', 'User'),
        'url' => ['#'],
        'active' => false,
        //'visible' => Yii::$app->user->can('haha'),
        'items' => [
            [
                'label' => '<i class="fa fa-user"></i> ' . Yii::t('app', 'User'),
                'url' => ['/user'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Address'),
                'url' => ['/address'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Favorite'),
                'url' => ['/favorite'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Point Log'),
                'url' => ['/point-log'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Coupon Type'),
                'url' => ['/coupon-type'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Coupon'),
                'url' => ['/coupon'],
            ],
        ],
    ],
    [
        'label' => '<i class="fa fa-cog"></i> ' . Yii::t('app', 'Operation'),
        'url' => ['#'],
        'active' => false,
        'items' => [
            [
                'label' => '<i class="fa fa-user"></i> ' . Yii::t('app', 'Cms Catalog'),
                'url' => ['/cms/cms-catalog'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Cms Show'),
                'url' => ['/cms/cms-show'],
            ],
        ],
    ],
    [
        'label' => '<i class="fa fa-cog"></i> ' . Yii::t('app', 'System'),
        'url' => ['#'],
        'active' => false,
        //'visible' => Yii::$app->user->can('haha'),
        'items' => [
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Payment'),
                'url' => ['/payment'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Shipment'),
                'url' => ['/shipment'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Auth Role'),
                'url' => ['/auth'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Setting'),
                'url' => ['/setting'],
            ],
            [
                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Region'),
                'url' => ['/region'],
            ],
        ],
    ],
];
echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-left'],
    'items' => $menuItemsMain,
    'encodeLabels' => false,
]);
$menuItems = [
    [
        'label' => Yii::t('app', 'Modify Password'),
        'url' => ['site/change-password'],
    ],
    ['label' => Yii::t('app', 'Home'), 'url' => ['/site/index']],
];
if (Yii::$app->user->isGuest) {
    $menuItems[] = ['label' => Yii::t('app', 'Login'), 'url' => ['/site/login']];
} else {
    $menuItems[] = [
        'label' => Yii::t('app', 'Logout') . '(' . Yii::$app->user->identity->username . ')',
        'url' => ['/site/logout'],
        'linkOptions' => ['data-method' => 'post']
    ];
}
echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-right'],
    'items' => $menuItems,
]);
NavBar::end();
