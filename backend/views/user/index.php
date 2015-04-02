<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\models\User;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Users');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'User'), ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a(Yii::t('app', 'Update ') . Yii::t('app', 'Supported By'), ['support'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'username',
            // 'auth_key',
            // 'password_hash',
            // 'password_reset_token',
            'email:email',
            /*[
                'attribute' => 'role',
                'value' => function ($model) {
                            return $model->roleLabel;
                        },
                'filter' => Html::activeDropDownList(
                        $searchModel,
                        'role',
                        $arrayRole,
                        ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                    )
            ],*/
            [
                'attribute' => 'auth_role',
                'value' => function ($model) {
                            return $model->authRole ? $model->authRole->name : '-';
                        },
                'filter' => Html::activeDropDownList(
                        $searchModel,
                        'auth_role',
                        User::getArrayAuthRole(),
                        ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                    )
            ],
            //'balance',
            'point',
            [
                'attribute' => 'recommended_by',
                'value' => function ($model) {
                    return $model->recommendedBy ? $model->recommendedBy->username : '-';
                },
            ],
            'recommended_name',
            [
                'attribute' => 'supported_by',
                'value' => function ($model) {
                    return $model->supportedBy ? $model->supportedBy->username : '-';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'supported_by',
                    ArrayHelper::map(\common\models\User::find()->where(['<', 'id', 10])->all(), 'id', 'username'),
                    ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                )
            ],
            [
                'attribute' => 'status',
                'format' => 'html',
                'value' => function ($model) {
                        if ($model->status === $model::STATUS_ACTIVE) {
                            $class = 'label-success';
                        } elseif ($model->status === $model::STATUS_INACTIVE) {
                            $class = 'label-warning';
                        } else {
                            $class = 'label-danger';
                        }

                        return '<span class="label ' . $class . '">' . $model->statusLabel . '</span>';
                    },
                'filter' => Html::activeDropDownList(
                        $searchModel,
                        'status',
                        $arrayStatus,
                        ['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Filter')]
                    )
            ],
            'created_at:date',
            //'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
