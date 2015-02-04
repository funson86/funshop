<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "cart".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $session_id
 * @property integer $goods_id
 * @property string $goods_sku
 * @property string $goods_name
 * @property integer $goods_number
 * @property string $market_price
 * @property string $price
 * @property integer $is_gift
 *
 * @property User $user
 */
class Cart extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cart';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'goods_id', 'goods_number', 'is_gift'], 'integer'],
            [['goods_id', 'goods_sku', 'goods_name'], 'required'],
            [['market_price', 'price'], 'number'],
            [['session_id', 'goods_name'], 'string', 'max' => 255],
            [['goods_sku'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'session_id' => Yii::t('app', 'Session ID'),
            'goods_id' => Yii::t('app', 'Goods ID'),
            'goods_sku' => Yii::t('app', 'Goods Sku'),
            'goods_name' => Yii::t('app', 'Goods Name'),
            'goods_number' => Yii::t('app', 'Goods Number'),
            'market_price' => Yii::t('app', 'Market Price'),
            'price' => Yii::t('app', 'Price'),
            'is_gift' => Yii::t('app', 'Is Gift'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
