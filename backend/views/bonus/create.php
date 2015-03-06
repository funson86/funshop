<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Bonus */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Bonus');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Bonuses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bonus-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
