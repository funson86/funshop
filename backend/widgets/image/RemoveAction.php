<?php

namespace backend\widgets\image;

use Yii;
use common\models\GoodsImage;
use yii\base\Action;

class RemoveAction extends Action
{
    public $uploadDir = '@webroot/upload';

    public function run($id)
    {
        $image = GoodsImage::findOne(['id' => $id]);
        if ($image) {
            $filename = $image->filename;
            if (GoodsImage::deleteAll(['id' => $id])) {
                if (unlink(\Yii::getAlias($this->uploadDir . '/' . $filename))) {
                    if (unlink(\Yii::getAlias($this->uploadDir . '/small-' . $filename))) {
                        Yii::$app->response->redirect(Yii::$app->request->referrer);
                    }
                }
            }
        }

        return false;
    }
}
