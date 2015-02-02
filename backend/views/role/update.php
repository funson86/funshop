<?php

$this->title = Yii::t('app', 'Update ') . Yii::t('app', '{name}', ['name' => $model->name]);
$this->params['breadcrumbs'] = [
    [
        'label' => Yii::t('app', 'Roles'),
        'url' => ['/role']
    ],
    $this->title
];

echo $this->render('_form', [
    'model' => $model,
    'permissions' => $permissions,
]);