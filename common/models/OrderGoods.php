<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "order_goods".
 *
 * @property integer $id
 * @property integer $order_id
 * @property integer $goods_id
 * @property string $goods_sku
 * @property string $goods_name
 * @property integer $goods_number
 * @property string $market_price
 * @property string $price
 * @property integer $type
 *
 * @property Order $order
 * @property Goods $goods
 */
class OrderGoods extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'order_goods';
    }

    /**
     * create_time, update_time to now()
     * crate_user_id, update_user_id to current login user id
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
            // BlameableBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_id', 'goods_id', 'goods_sku', 'goods_name'], 'required'],
            [['order_id', 'goods_id', 'goods_number', 'type'], 'integer'],
            [['market_price', 'price'], 'number'],
            [['goods_sku'], 'string', 'max' => 64],
            [['goods_name'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'order_id' => Yii::t('app', 'Order ID'),
            'goods_id' => Yii::t('app', 'Goods ID'),
            'goods_sku' => Yii::t('app', 'Goods Sku'),
            'goods_name' => Yii::t('app', 'Goods Name'),
            'goods_number' => Yii::t('app', 'Goods Number'),
            'market_price' => Yii::t('app', 'Market Price'),
            'price' => Yii::t('app', 'Price'),
            'type' => Yii::t('app', 'Type'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(Order::className(), ['id' => 'order_id']);
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
