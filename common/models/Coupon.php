<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "coupon".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $coupon_type_id
 * @property string $money
 * @property string $min_amount
 * @property integer $started_at
 * @property integer $ended_at
 * @property string $sn
 * @property integer $order_id
 * @property integer $used_at
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property User $user
 * @property CouponType $couponType
 */
class Coupon extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'coupon';
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
            [['coupon_type_id', 'money', 'started_at', 'ended_at'], 'required'],
            [['user_id', 'coupon_type_id', 'started_at', 'ended_at', 'order_id', 'used_at', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['money', 'min_amount'], 'number'],
            [['sn'], 'string', 'max' => 255]
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
            'coupon_type_id' => Yii::t('app', 'Coupon Type ID'),
            'money' => Yii::t('app', 'Money'),
            'min_amount' => Yii::t('app', 'Min Amount'),
            'started_at' => Yii::t('app', 'Started At'),
            'ended_at' => Yii::t('app', 'Ended At'),
            'sn' => Yii::t('app', 'Sn'),
            'order_id' => Yii::t('app', 'Order ID'),
            'used_at' => Yii::t('app', 'Used At'),
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
    public function getCouponType()
    {
        return $this->hasOne(CouponType::className(), ['id' => 'coupon_type_id']);
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
