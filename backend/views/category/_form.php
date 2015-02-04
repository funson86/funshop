<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Category;

/* @var $this yii\web\View */
/* @var $model common\models\Category */
/* @var $form yii\widgets\ActiveForm */
$parentCategory = ArrayHelper::merge([0 => Yii::t('blog', 'Root Catalog')], ArrayHelper::map(Category::get(0, Category::find()->asArray()->all()), 'id', 'label'));
unset($parentCategory[$model->id]);
?>

<div class="category-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'parent_id')->dropDownList($parentCategory) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'brief')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'is_nav')->dropDownList(\funson86\cms\models\YesNo::labels()) ?>

    <?= $form->field($model, 'banner')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'keywords')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'redirect_url')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'sort_order')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList(\common\models\Status::labels()) ?>

    <?= \backend\widgets\image\ImageDropzone::widget([
        'name' => 'file',
        'url' => ['/backend/product/upload'],
        'removeUrl' => ['/backend/product/remove'],
        'uploadDir' => '/theme/resources/product-images',
        'sortable' => true,
        'sortableOptions' => [
            'items' => '.dz-image-preview',
        ],
        'goodsId' => 1,
        //'modelId' => 1,
        'htmlOptions' => [
            'class' => 'table table-striped files',
            'id' => 'previews',
        ],
        'options' => [
            'clickable' => ".fileinput-button",
        ],
    ]); ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
