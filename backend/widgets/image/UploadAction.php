<?php

namespace backend\widgets\image;

use Yii;
use common\models\GoodsImage;
use yii\helpers\FileHelper;

class UploadAction extends \devgroup\dropzone\UploadAction
{
    public $thumbnail_width = 400;
    public $thumbnail_height = 400;


    public function init()
    {
        parent::init();

        $this->upload = $this->upload . '/' . date('Ym');
        $this->uploadDir = Yii::getAlias('@frontend/web/' . $this->upload . '/');
        if (!file_exists($this->uploadDir)) {
            FileHelper::createDirectory($this->uploadDir);
        }
        $this->uploadSrc = Yii::getAlias('@web/' . $this->upload . '/');

        if (!isset($this->afterUploadHandler)) {
            $this->afterUploadHandler = [$this, 'afterUpload'];
        }
    }

    public function afterUpload($data)
    {
        ImageDropzone::saveThumbnail($this->uploadDir . '/', $data['filename'], $this->thumbnail_width, $this->thumbnail_height);

        $image = new GoodsImage([
            'goods_id' => $data['params']['goodsId'],
            'filename' => $data['filename'],
            'src' => $data['src'] . $data['filename'],
            'thumb_src' => $data['src'] . 'small-' . $data['filename'],
            'description' => '',
            'sort_order' => 50,
        ]);
        if ($image->save()) {
            return $image->toArray();
        } else {
            return $image->getErrors();
        }

    }
}
