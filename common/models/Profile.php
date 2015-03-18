<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "profile".
 *
 * @property integer $user_id
 * @property string $name
 * @property string $surname
 * @property string $avatar_url
 * @property integer $sex
 * @property string $birthday
 * @property integer $country
 * @property integer $province
 * @property integer $city
 * @property integer $district
 *
 * @property User $user
 */
class Profile extends \yii\db\ActiveRecord
{
    public $year;
    public $month;
    public $day;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profile';
    }

    /**
     * create_time, update_time to now()
     * crate_user_id, update_user_id to current login user id
     */
    public function behaviors()
    {
        return [
            // TimestampBehavior::className(),
            // BlameableBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sex', 'country', 'province', 'city', 'district'], 'integer'],
            [['birthday'], 'safe'],
            [['name', 'surname', 'avatar_url'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'user_id' => Yii::t('app', 'User ID'),
            'name' => Yii::t('app', 'Real Name'),
            'surname' => Yii::t('app', 'Surname'),
            'avatar_url' => Yii::t('app', 'Avatar Url'),
            'sex' => Yii::t('app', 'Sex'),
            'birthday' => Yii::t('app', 'Birthday'),
            'country' => Yii::t('app', 'Country'),
            'province' => Yii::t('app', 'Province'),
            'city' => Yii::t('app', 'City'),
            'district' => Yii::t('app', 'District'),
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

    public static function getYears()
    {
        $data = [];
        $thisYear = date('Y');
        for ($i = $thisYear; $i >= 1939; $i--) {
            $data[$i] = $i;
        }

        return $data;
    }

    public static function getMonths()
    {
        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $data[$i] = $i;
        }

        return $data;
    }

    public static function getDays()
    {
        $data = [];
        for ($i = 1; $i <= 31; $i++) {
            $data[$i] = $i;
        }

        return $data;
    }

}
