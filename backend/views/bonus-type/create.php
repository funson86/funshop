<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\BonusType */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Bonus Type');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Bonus Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bonus-type-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
