<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Category;
use mihaildev\ckeditor\CKEditor;

/* @var $this yii\web\View */
/* @var $model common\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-6\">{input}{hint}</div>\n<div class=\"col-lg-5\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-1 control-label'],
        ],
    ]); ?>

    <?= $form->field($model, 'category_id')->dropDownList(ArrayHelper::map(Category::get(0, Category::find()->asArray()->all()), 'id', 'label')) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'sku')->textInput(['maxlength' => 64]) ?>

    <?= $form->field($model, 'stock')->textInput() ?>

    <?= $form->field($model, 'weight')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'market_price')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => 10]) ?>

    <?= $form->field($model, 'brief')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'content')->widget(CKEditor::className(),[
        'editorOptions' => [
            'preset' => 'full',
            'inline' => false,
        ],
    ]); ?>

    <?= $form->field($model, 'keywords')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'type')->checkboxList(\common\models\ProductType::labels()) ?>

    <?= $form->field($model, 'brand_id')->dropDownList(ArrayHelper::map(\common\models\Brand::find()->all(), 'id', 'name'), ['prompt' => Yii::t('app', 'Please Select')]) ?>

    <?= $form->field($model, 'status')->dropDownList(\common\models\Status::labels()) ?>

    <?php if (!$model->isNewRecord) { ?>
        <div class="form-group">
            <?php
            foreach ($model->productImages as $image) {
                echo '<div style="width:150px; float: left; text-align: center">';
                echo '<a href="' . \Yii::$app->getUrlManager()->createUrl(['product/remove', 'id' => $image->id]) . '" title="' . Yii::t('app', 'Delete') . '" data-confirm="' . Yii::t('app', 'Are you sure you want to delete this item?') . '" data-method="post" data-pjax="0"><span class="glyphicon glyphicon-trash"></span></a><br>';
                if (strpos($image->thumb, 'http://') === null) {
                    $file = Yii::getAlias('@frontend/web' . $image->thumb);
                    $fileType = \yii\helpers\FileHelper::getMimeType($file);
                    $data = base64_encode(file_get_contents($file));
                    echo "<img src='data:" . $fileType . ";base64," . $data . "' width=100><br>";
                } else {
                    echo "<img src='$image->thumb' width=100><br>";
                }
                echo Yii::t('app', 'Sort Order') . ' <input style="width:50px" name="imageSort[' . $image->id . ']" value="' . $image->sort_order . '">';
                echo '</div>';
            } ?>
            <div style="clear:both"></div>
        </div>

        <div class="form-group">
            <?= \backend\widgets\image\ImageDropzone::widget([
                'name' => 'file',
                'url' => ['upload'],
                'sortable' => true,
                'sortableOptions' => [
                    //'items' => '.dz-image-preview',
                ],
                //'model' => $model,
                //'attribute' => 'image',
                'htmlOptions' => [
                    //'class' => 'table table-striped files',
                    //'id' => 'previews',
                ],
                'options' => [
                    //'clickable' => ".fileinput-button",
                    'params' => ['productId' => $model->id,],
                ],
            ]); ?>
        </div>

    <?php } ?>

    <div class="form-group">
        <label class="col-lg-2 control-label" for="">&nbsp;</label>
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php $this->registerJs('
function removeImage() {
    alert("ok");
}
') ?>