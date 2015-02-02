<?php

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Role');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Roles'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

echo $this->render('_form', [
    'model' => $model,
    'permissions' => $permissions
]);
