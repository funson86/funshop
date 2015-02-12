<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "region".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $path
 * @property string $language
 * @property integer $grade
 */
class Region extends \yii\db\ActiveRecord
{
    const GRADE_COUNTRY = 1;
    const GRADE_PROVINCE = 2;
    const GRADE_CITY = 3;
    const GRADE_DISTRICT = 4;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'region';
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
            [['parent_id', 'grade'], 'integer'],
            [['name', 'language'], 'required'],
            [['name'], 'string', 'max' => 64],
            [['path'], 'string', 'max' => 255],
            [['language'], 'string', 'max' => 16]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'parent_id' => Yii::t('app', 'Parent ID'),
            'name' => Yii::t('app', 'Name'),
            'path' => Yii::t('app', 'Path'),
            'language' => Yii::t('app', 'Language'),
            'grade' => Yii::t('app', 'Grade'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParent()
    {
        return $this->hasOne(self::className(), ['id' => 'parent_id']);
    }

    public static function getGradeLabel($id = null)
    {
        $data = [
            self::GRADE_COUNTRY => Yii::t('app', 'GRADE_COUNTRY'),
            self::GRADE_PROVINCE => Yii::t('app', 'GRADE_PROVINCE'),
            self::GRADE_CITY => Yii::t('app', 'GRADE_CITY'),
            self::GRADE_DISTRICT => Yii::t('app', 'GRADE_DISTRICT'),
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
