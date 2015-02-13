<?php

namespace backend\widgets\image;

use common\models\ProductImage;
use devgroup\dropzone\DropZone;
use Imagine\Image\ManipulatorInterface;
use Yii;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\helpers\Url;

class ImageDropzone extends DropZone
{
    public $goodsId;

    public static function saveThumbnail($dir, $filename, $width = 400, $height = 400)
    {
        if (trim($filename) && file_exists(Yii::getAlias($dir . '/' . $filename))) {

            $image = \yii\imagine\Image::thumbnail(Yii::getAlias($dir . '/' . $filename), $width, $height, ManipulatorInterface::THUMBNAIL_INSET);
            $image->save($dir . '/small-' . $filename);


            return 'small-' . $filename;
        }

        return '';
    }

}
