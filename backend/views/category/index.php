<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Categories');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create ') . Yii::t('app', 'Category'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th><?= Yii::t('app', 'Title') ?> </th>
            <th><?= Yii::t('app', 'Sort Order') ?></th>
            <th><?= Yii::t('app', 'Is Nav') ?></th>
            <th><?= Yii::t('app', 'Status') ?></th>
            <th><?= Yii::t('app', 'Actions') ?></th>

        </tr>
        </thead>
        <tbody>
        <?php foreach($dataProvider as $item){ ?>
            <tr data-key="1">
                <td><?= $item['id']; ?></td>
                <td><?= $item['label']; ?></td>
                <td><?= $item['sort_order']; ?></td>
                <td><?= \common\models\YesNo::labels()[$item['is_nav']]; ?></td>
                <td><?= \common\models\Status::labels()[$item['status']]; ?></td>
                <td>
                    <!--a href="<?= \Yii::$app->getUrlManager()->createUrl(['category/create','parent_id'=>$item['id']]); ?>" title="<?= Yii::t('cms', 'Add Sub Catalog');?>" data-pjax="0"><span class="glyphicon glyphicon-plus-sign"></span></a-->
                    <a href="<?= \Yii::$app->getUrlManager()->createUrl(['category/view','id'=>$item['id']]); ?>"" title="<?= Yii::t('cms', 'View');?>" data-pjax="0"><span class="glyphicon glyphicon-eye-open"></span></a>
                    <a href="<?= \Yii::$app->getUrlManager()->createUrl(['category/update','id'=>$item['id']]); ?>"" title="<?= Yii::t('cms', 'Update');?>" data-pjax="0"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="<?= \Yii::$app->getUrlManager()->createUrl(['category/delete','id'=>$item['id']]); ?>"" title="<?= Yii::t('cms', 'Delete');?>" data-confirm="<?= Yii::t('cms', 'Are you sure you want to delete this item?');?>" data-method="post" data-pjax="0"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>

</div>
