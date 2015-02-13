<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "category".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $brief
 * @property integer $is_nav
 * @property string $banner
 * @property string $keywords
 * @property string $description
 * @property string $redirect_url
 * @property integer $sort_order
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property Goods[] $goods
 */
class Category extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'category';
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
            [['parent_id', 'is_nav', 'sort_order', 'status', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['name'], 'required'],
            [['description'], 'string'],
            [['name'], 'string', 'max' => 128],
            [['brief', 'banner', 'keywords', 'redirect_url'], 'string', 'max' => 255]
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
            'brief' => Yii::t('app', 'Brief'),
            'is_nav' => Yii::t('app', 'Is Nav'),
            'banner' => Yii::t('app', 'Banner'),
            'keywords' => Yii::t('app', 'Keywords'),
            'description' => Yii::t('app', 'Description'),
            'redirect_url' => Yii::t('app', 'Redirect Url'),
            'sort_order' => Yii::t('app', 'Sort Order'),
            'status' => Yii::t('app', 'Status'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_by' => Yii::t('app', 'Updated By'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['category_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParent()
    {
        return $this->hasOne(self::className(), ['id' => 'parent_id']);
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


    /**
     * Get all catalog order by parent/child with the space before child label
     * Usage: ArrayHelper::map(Catalog::get(0, Catalog::find()->asArray()->all()), 'id', 'label')
     * @param int $parentId  parent catalog id
     * @param array $array  catalog array list
     * @param int $level  catalog level, will affect $repeat
     * @param int $add  times of $repeat
     * @param string $repeat  symbols or spaces to be added for sub catalog
     * @return array  catalog collections
     */
    static public function get($parentId = 0, $array = [], $level = 0, $add = 2, $repeat = '　')
    {
        $strRepeat = '';
        // add some spaces or symbols for non top level categories
        if ($level > 1) {
            for ($j = 0; $j < $level; $j++) {
                $strRepeat .= $repeat;
            }
        }

        $newArray = array ();
        //performance is not very good here
        foreach ((array)$array as $v) {
            if ($v['parent_id'] == $parentId) {
                $item = (array)$v;
                $item['label'] = $strRepeat . (isset($v['title']) ? $v['title'] : $v['name']);
                $newArray[] = $item;

                $tempArray = self::get($v['id'], $array, ($level + $add), $add, $repeat);
                if ($tempArray) {
                    $newArray = array_merge($newArray, $tempArray);
                }
            }
        }
        return $newArray;
    }


    /**
     * Get all children id as a array
     * Usage:
     * $ids = Catalog::getCatalogIdStr($id, CmsCatalog::find()->asArray()->all());
     * $shows = CmsShow::find()->where(['catalog_id' => $ids,])->all();
     * @param int $parentId  parent catalog id
     * @param array $array  catalog array list
     * @return array  catalog Id collections. eg: [2, 3, 7, 8]
     */
    static public function getArraySubCatalogId($parentId = 0, $array = [])
    {
        $result[] = $parentId;
        foreach ((array)$array as $v) {
            if ($v['parent_id'] == $parentId) {
                $tempResult = self::getArraySubCatalogId($v['id'], $array);
                if ($tempResult) {
                    $result = array_merge($result, $tempResult);
                }
            }
        }
        return $result;
    }

    /**
     * Get the root catalog id
     * Usage: $rootId = Catalog::getArraySubCatalogId($id, Catalog::find()->asArray()->all());
     * @param int $id  parent catalog id
     * @param array $array  catalog array list
     * @return int root catalog id
     */
    static public function getRootCatalogId($id = 0, $array = [])
    {
        if (0 == $id)
            return 0;

        foreach ((array)$array as $v) {
            if ($v['id'] == $id) {
                $parentId = $v['parent_id'];
                if(0 == $parentId)
                    return $id;
                else
                    return self::getRootCatalogId($parentId, $array);
            }
        }
    }

    /**
     * Get all children id as a array
     * Usage:
     * $ids = Catalog::getCatalogIdStr($id, CmsCatalog::find()->asArray()->all());
     * $shows = CmsShow::find()->where(['catalog_id' => $ids,])->all();
     * @param int $parentId  parent catalog id
     * @param array $array  catalog array list
     * @return array  catalog Id collections. eg: [2, 3, 7, 8]
     */
    static public function getCatalogPath($id = 0, $array = [])
    {
        if (0 == $id)
            return [];

        $result = [];
        $tmpId = $id;
        while ($tmpId > 0) {
            array_push($result, $tmpId);
            $tmpId = self::getCatalogParentId($tmpId, $array);
        }

        return array_reverse($result);

        /*foreach ((array)$array as $v) {
            if ($v['id'] == $id) {
                if ($v['parent_id'] == 0) {
                    array_push($result, $id);
                } else {
                    $result = self::getCatalogPath($v['parent_id'], $array);
                }
            }
            if ($v['parent_id'] == $id) {
                $tempResult = self::getArraySubCatalogId($v['id'], $array);
                if ($tempResult) {
                    $result = array_merge($result, $tempResult);
                }
            }
        }
        return $result;*/
    }

    /**
     * Get all children id as a array
     * Usage:
     * $ids = Catalog::getCatalogIdStr($id, CmsCatalog::find()->asArray()->all());
     * $shows = CmsShow::find()->where(['catalog_id' => $ids,])->all();
     * @param int $parentId  parent catalog id
     * @param array $array  catalog array list
     * @return array  catalog Id collections. eg: [2, 3, 7, 8]
     */
    static public function getCatalogParentId($id = 0, $array = [])
    {
        if (0 == $id)
            return 0;

        foreach ((array)$array as $v) {
            if ($v['id'] == $id) {
                return (int)$v['parent_id'];
            }
        }

        return false;
    }

    /**
     * Get the root catalog id, then get the sub catalog of the root calalog
     * Usage: $rootId = Catalog::getArraySubCatalogId($id, Catalog::find()->asArray()->all());
     * @param int $id  parent catalog id
     * @param array $array  catalog array list
     * @return array  the sub catalog of root catalog Id collections.
     */
    static public function getRootCatalogSub2($id = 0, $array = [])
    {
        $arrayResult = array();
        $rootId = self::getRootCatalogId($id, $array);
        foreach ((array)$array as $v) {
            if ($v['parent_id'] == $rootId) {
                array_push($arrayResult, $v);
            }
        }

        return $arrayResult;
    }

}
