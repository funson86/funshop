<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "point_log".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $type
 * @property integer $point
 * @property string $remark
 * @property integer $balance
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property User $user
 */
class PointLog extends \yii\db\ActiveRecord
{
    const POINT_TYPE_BOUGHT = 1;
    const POINT_TYPE_COMMENT = 2;
    const POINT_TYPE_BUYING = 11;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'point_log';
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
            [['user_id', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'required'],
            [['user_id', 'type', 'point', 'balance', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['remark'], 'string', 'max' => 255]
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
            'type' => Yii::t('app', 'Type'),
            'point' => Yii::t('app', 'Point'),
            'remark' => Yii::t('app', 'Remark'),
            'balance' => Yii::t('app', 'Balance'),
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


    public static function getTypeLabels($id = null)
    {
        $data = [
            self::POINT_TYPE_BOUGHT => Yii::t('app', 'POINT_TYPE_BOUGHT'),
            self::POINT_TYPE_COMMENT => Yii::t('app', 'POINT_TYPE_COMMENT'),
            self::POINT_TYPE_BUYING => Yii::t('app', 'POINT_TYPE_BUYING'),
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
