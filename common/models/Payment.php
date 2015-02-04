<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "payment".
 *
 * @property integer $id
 * @property string $code
 * @property string $name
 * @property string $fee
 * @property string $description
 * @property integer $sort_order
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 */
class Payment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'payment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'name'], 'required'],
            [['description'], 'string'],
            [['sort_order', 'status', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['code'], 'string', 'max' => 32],
            [['name', 'fee'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'Code'),
            'name' => Yii::t('app', 'Name'),
            'fee' => Yii::t('app', 'Fee'),
            'description' => Yii::t('app', 'Description'),
            'sort_order' => Yii::t('app', 'Sort Order'),
            'status' => Yii::t('app', 'Status'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_by' => Yii::t('app', 'Updated By'),
        ];
    }
}
