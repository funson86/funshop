<?php

namespace frontend\components;

use Yii;

class Controller extends \yii\web\Controller
{
    public function beforeAction($action)
    {
        if (parent::beforeAction($action)) {
            if (!Yii::$app->session->isActive)
                Yii::$app->session->open();
            return true;
        } else {
            return false;
        }
    }

}