<?php
/* @var $this yii\web\View */

$this->title = 'Welcome To Funshop';
?>
<div class="site-index">
    <p><?= Yii::t('app', 'Order Stat') ?></p>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>&nbsp;</th>
            <th><?= Yii::t('app', 'Today') ?></th>
            <th><?= Yii::t('app', 'This Month') ?></th>
        </tr>
        </thead>
        <tbody>
            <tr data-key="1">
                <td><?= Yii::t('app', 'Count') ?></td>
                <td><?= $dataOrder['todayCount'] ?></td>
                <td><?= $dataOrder['thisMonthCount'] ?></td>
            </tr>
            <tr data-key="1">
                <td><?= Yii::t('app', 'Amount') ?></td>
                <td><?= $dataOrder['todayAmount'] ?></td>
                <td><?= $dataOrder['thisMonthAmount'] ?></td>
            </tr>
        </tbody>
    </table>
</div>
<div class="site-index">
    <p><?= Yii::t('app', 'User Stat') ?></p>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>&nbsp;</th>
            <th><?= Yii::t('app', 'Today') ?></th>
            <th><?= Yii::t('app', 'This Month') ?></th>
        </tr>
        </thead>
        <tbody>
            <tr data-key="1">
                <td><?= Yii::t('app', 'Count') ?></td>
                <td><?= $dataUser['todayCount'] ?></td>
                <td><?= $dataUser['thisMonthCount'] ?></td>
            </tr>
        </tbody>
    </table>
</div>
