<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "goods_image".
 *
 * @property integer $id
 * @property integer $goods_id
 * @property string $filename
 * @property string $description
 * @property string $src
 * @property string $thumb_src
 * @property string $origin_src
 * @property integer $sort_order
 *
 * @property Goods $goods
 */
class GoodsImage extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'goods_image';
    }

    /**
     * create_time, update_time to now()
     * crate_user_id, update_user_id to current login user id
     */
    public function behaviors()
    {
        return [
            //TimestampBehavior::className(),
            // BlameableBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['goods_id'], 'required'],
            [['goods_id', 'sort_order'], 'integer'],
            [['filename'], 'string', 'max' => 128],
            [['description', 'src', 'thumb_src', 'origin_src'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'goods_id' => Yii::t('app', 'Goods ID'),
            'filename' => Yii::t('app', 'Filename'),
            'description' => Yii::t('app', 'Description'),
            'src' => Yii::t('app', 'Src'),
            'thumb_src' => Yii::t('app', 'Thumb Src'),
            'origin_src' => Yii::t('app', 'Origin Src'),
            'sort_order' => Yii::t('app', 'Sort Order'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGoods()
    {
        return $this->hasOne(Goods::className(), ['id' => 'goods_id']);
    }

    /**
     * Before save.
     * 
     */
    /*public function beforeSave($insert)
    {
        if(parent::beforeSave($insert))
        {
            // add your code here
            return true;
        }
        else
            return false;
    }*/

    /**
     * After save.
     *
     */
    /*public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);
        // add your code here
    }*/

}
