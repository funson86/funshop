<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Consultation */

$this->title = Yii::t('app', 'Create ') . Yii::t('app', 'Consultation');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Consultations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="consultation-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
