<?php

use yii\helpers\Html;
use kartik\icons\Icon;
use yii\widgets\DetailView;

$this->title = Yii::t('app', 'Role') . " $model->name";
$this->params['breadcrumbs'] = [
    [
        'label' => Yii::t('app', 'Roles'),
        'url' => ['/role']
    ],
    $model->name
];
?>

<div class="row">
    <div class="col-lg-6">

        <?php
        echo DetailView::widget([
            'model' => $model,
            //'condensed' => true,
            //'hover' => true,
            //'mode' => DetailView::MODE_VIEW,
            //'enableEditMode' => false,
            /*'panel' => [
                'heading' => Icon::show('user') . Yii::t('auth', 'Role') .
                    Html::a(Icon::show('user') . Yii::t('auth', 'Update'), ['update', 'name' => $model->name], ['class' => 'btn-success btn-sm btn-dv pull-right']),
                //'type' => DetailView::TYPE_DEFAULT,
            ],*/
            'attributes' => [
                'name',
                'description'
           ],
        ]);
        ?>
    </div>

    <div class="col-lg-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <?= Yii::t('app', 'Permissions')?>
            </div>

            <div class="panel-body">
                <div class="list-group">
                    <?php foreach($model->_permissions as $key): ?>
                        <a class="list-group-item">
                            <?= $permissions[$key]?>
                        </a>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>
</div>
