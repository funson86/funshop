<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "order".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $sn
 * @property string $consignee
 * @property integer $country
 * @property integer $province
 * @property integer $city
 * @property integer $district
 * @property string $address
 * @property string $zipcode
 * @property string $phone
 * @property string $mobile
 * @property string $email
 * @property string $remark
 * @property integer $pay_id
 * @property string $pay_name
 * @property integer $shipping_id
 * @property string $shipping_name
 * @property integer $pay_status
 * @property integer $shipping_status
 * @property string $pay_fee
 * @property string $shipping_fee
 * @property string $tax
 * @property string $invoice
 * @property integer $status
 * @property integer $paid_at
 * @property integer $shipped_at
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property User $user
 * @property OrderGoods[] $orderGoods
 */
class Order extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'order';
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
            [['user_id', 'sn'], 'required'],
            [['user_id', 'country', 'province', 'city', 'district', 'pay_id', 'shipping_id', 'pay_status', 'shipping_status', 'status', 'paid_at', 'shipped_at', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['pay_fee', 'shipping_fee', 'tax'], 'number'],
            [['sn', 'phone', 'mobile', 'email'], 'string', 'max' => 32],
            [['consignee'], 'string', 'max' => 64],
            [['address', 'remark', 'pay_name', 'shipping_name', 'invoice'], 'string', 'max' => 255],
            [['zipcode'], 'string', 'max' => 16]
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
            'sn' => Yii::t('app', 'Sn'),
            'consignee' => Yii::t('app', 'Consignee'),
            'country' => Yii::t('app', 'Country'),
            'province' => Yii::t('app', 'Province'),
            'city' => Yii::t('app', 'City'),
            'district' => Yii::t('app', 'District'),
            'address' => Yii::t('app', 'Address'),
            'zipcode' => Yii::t('app', 'Zipcode'),
            'phone' => Yii::t('app', 'Phone'),
            'mobile' => Yii::t('app', 'Mobile'),
            'email' => Yii::t('app', 'Email'),
            'remark' => Yii::t('app', 'Remark'),
            'pay_id' => Yii::t('app', 'Pay ID'),
            'pay_name' => Yii::t('app', 'Pay Name'),
            'shipping_id' => Yii::t('app', 'Shipping ID'),
            'shipping_name' => Yii::t('app', 'Shipping Name'),
            'pay_status' => Yii::t('app', 'Pay Status'),
            'shipping_status' => Yii::t('app', 'Shipping Status'),
            'pay_fee' => Yii::t('app', 'Pay Fee'),
            'shipping_fee' => Yii::t('app', 'Shipping Fee'),
            'tax' => Yii::t('app', 'Tax'),
            'invoice' => Yii::t('app', 'Invoice'),
            'status' => Yii::t('app', 'Status'),
            'paid_at' => Yii::t('app', 'Paid At'),
            'shipped_at' => Yii::t('app', 'Shipped At'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_by' => Yii::t('app', 'Updated By'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderGoods()
    {
        return $this->hasMany(OrderGoods::className(), ['order_id' => 'id']);
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
