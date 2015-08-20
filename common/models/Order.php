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
 * @property integer $payment_method
 * @property integer $payment_status
 * @property integer $payment_id
 * @property string $payment_name
 * @property string $payment_fee
 * @property integer $shipment_status
 * @property integer $shipment_id
 * @property string $shipment_name
 * @property string $shipment_fee
 * @property string $amount
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
 * @property OrderProduct[] $orderProducts
 */
class Order extends \yii\db\ActiveRecord
{
    const STATUS_CANCEL = -1;
    const STATUS_DELETED = -2;

    const PAYMENT_METHOD_PAY = 1;
    const PAYMENT_METHOD_COD = 2;

    const PAYMENT_STATUS_COD = 10;
    const PAYMENT_STATUS_UNPAID = 20;
    const PAYMENT_STATUS_PAYING = 30;
    const PAYMENT_STATUS_PAID = 40;

    const SHIPMENT_STATUS_UNSHIPPED = 60;
    const SHIPMENT_STATUS_PREPARING = 70;
    const SHIPMENT_STATUS_SHIPPED = 80;
    const SHIPMENT_STATUS_RECEIVED = 90;

    public $address_id;

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
            BlameableBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'sn'], 'required'],
            [['user_id', 'country', 'province', 'city', 'district', 'payment_method', 'payment_status', 'payment_id', 'shipment_status', 'shipment_id', 'status', 'paid_at', 'shipped_at', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['payment_fee', 'shipment_fee', 'amount', 'tax'], 'number'],
            [['sn', 'phone', 'mobile', 'email'], 'string', 'max' => 32],
            [['consignee'], 'string', 'max' => 64],
            [['address', 'remark', 'shipment_name', 'invoice'], 'string', 'max' => 255],
            [['zipcode'], 'string', 'max' => 16],
            [['payment_name'], 'string', 'max' => 120]
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
            'payment_method' => Yii::t('app', 'Payment Method'),
            'payment_status' => Yii::t('app', 'Payment Status'),
            'payment_id' => Yii::t('app', 'Payment ID'),
            'payment_name' => Yii::t('app', 'Payment Name'),
            'payment_fee' => Yii::t('app', 'Payment Fee'),
            'shipment_status' => Yii::t('app', 'Shipment Status'),
            'shipment_id' => Yii::t('app', 'Shipment ID'),
            'shipment_name' => Yii::t('app', 'Shipment Name'),
            'shipment_fee' => Yii::t('app', 'Shipment Fee'),
            'amount' => Yii::t('app', 'Amount'),
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
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'created_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'updated_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCountry0()
    {
        return $this->hasOne(Region::className(), ['id' => 'country']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvince0()
    {
        return $this->hasOne(Region::className(), ['id' => 'province']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCity0()
    {
        return $this->hasOne(Region::className(), ['id' => 'city']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDistrict0()
    {
        return $this->hasOne(Region::className(), ['id' => 'district']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderProducts()
    {
        return $this->hasMany(OrderProduct::className(), ['order_id' => 'id']);
    }

    public static function getPaymentMethodLabels($id = null)
    {
        $data = [
            self::PAYMENT_METHOD_PAY => Yii::t('app', 'PAYMENT_METHOD_PAY'),
            self::PAYMENT_METHOD_COD => Yii::t('app', 'PAYMENT_METHOD_COD'),
        ];

        if ($id !== null && isset($data[$id])) {
            return $data[$id];
        } else {
            return $data;
        }
    }

    public static function getStatusLabels($id = null)
    {
        $data = [
            self::STATUS_CANCEL => Yii::t('app', 'STATUS_CANCEL'),
            self::STATUS_DELETED => Yii::t('app', 'STATUS_DELETED'),
            self::PAYMENT_STATUS_COD => Yii::t('app', 'PAYMENT_STATUS_COD'),
            self::PAYMENT_STATUS_UNPAID => Yii::t('app', 'PAYMENT_STATUS_UNPAID'),
            self::PAYMENT_STATUS_PAYING => Yii::t('app', 'PAYMENT_STATUS_PAYING'),
            self::PAYMENT_STATUS_PAID => Yii::t('app', 'PAYMENT_STATUS_PAID'),
            self::SHIPMENT_STATUS_UNSHIPPED => Yii::t('app', 'SHIPMENT_STATUS_UNSHIPPED'),
            self::SHIPMENT_STATUS_PREPARING => Yii::t('app', 'SHIPMENT_STATUS_PREPARING'),
            self::SHIPMENT_STATUS_SHIPPED => Yii::t('app', 'SHIPMENT_STATUS_SHIPPED'),
            self::SHIPMENT_STATUS_RECEIVED => Yii::t('app', 'SHIPMENT_STATUS_RECEIVED'),
        ];

        if ($id !== null && isset($data[$id])) {
            return $data[$id];
        } else {
            return $data;
        }
    }

    public static function getPaymentStatusLabels($id = null)
    {
        $data = [
            self::PAYMENT_STATUS_COD => Yii::t('app', 'PAYMENT_STATUS_COD'),
            self::PAYMENT_STATUS_UNPAID => Yii::t('app', 'PAYMENT_STATUS_UNPAID'),
            self::PAYMENT_STATUS_PAYING => Yii::t('app', 'PAYMENT_STATUS_PAYING'),
            self::PAYMENT_STATUS_PAID => Yii::t('app', 'PAYMENT_STATUS_PAID'),
        ];

        if ($id !== null && isset($data[$id])) {
            return $data[$id];
        } else {
            return $data;
        }
    }

    public static function getShipmentStatusLabels($id = null)
    {
        $data = [
            self::SHIPMENT_STATUS_UNSHIPPED => Yii::t('app', 'SHIPMENT_STATUS_UNSHIPPED'),
            self::SHIPMENT_STATUS_PREPARING => Yii::t('app', 'SHIPMENT_STATUS_PREPARING'),
            self::SHIPMENT_STATUS_SHIPPED => Yii::t('app', 'SHIPMENT_STATUS_SHIPPED'),
            self::SHIPMENT_STATUS_RECEIVED => Yii::t('app', 'SHIPMENT_STATUS_RECEIVED'),
        ];

        if ($id !== null && isset($data[$id])) {
            return $data[$id];
        } else {
            return $data;
        }
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
