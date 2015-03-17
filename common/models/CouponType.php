<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "coupon_type".
 *
 * @property integer $id
 * @property string $name
 * @property string $money
 * @property string $min_amount
 * @property integer $type
 * @property integer $started_at
 * @property integer $ended_at
 * @property string $min_goods_amount
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property Coupon[] $coupons
 */
class CouponType extends \yii\db\ActiveRecord
{
    const COUPON_TYPE_USER = 1;
    const COUPON_TYPE_ORDER = 2;
    const COUPON_TYPE_AMOUNT = 3;
    const COUPON_TYPE_OFFLINE = 4;

    public $users;
    public $numbers;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'coupon_type';
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
            [['name', 'money', 'started_at', 'ended_at'], 'required'],
            [['money', 'min_amount', 'min_goods_amount'], 'number'],
            [['type', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['name'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'money' => Yii::t('app', 'Money'),
            'min_amount' => Yii::t('app', 'Min Amount'),
            'type' => Yii::t('app', 'Type'),
            'started_at' => Yii::t('app', 'Started At'),
            'ended_at' => Yii::t('app', 'Ended At'),
            'min_goods_amount' => Yii::t('app', 'Min Goods Amount'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_by' => Yii::t('app', 'Updated By'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCoupons()
    {
        return $this->hasMany(Coupon::className(), ['coupon_type_id' => 'id']);
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

    public static function labels($id = null)
    {
        $data = [
            self::COUPON_TYPE_USER => Yii::t('app', 'COUPON_TYPE_USER'),
            self::COUPON_TYPE_ORDER => Yii::t('app', 'COUPON_TYPE_ORDER'),
            self::COUPON_TYPE_AMOUNT => Yii::t('app', 'COUPON_TYPE_AMOUNT'),
            self::COUPON_TYPE_OFFLINE => Yii::t('app', 'COUPON_TYPE_OFFLINE'),
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
