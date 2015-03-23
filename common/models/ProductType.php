<?php
/**
 * Common Status Class
 * User: funson
 * Date: 2014/06/25
 * Time: 9:50
 */

namespace common\models;

use Yii;

class ProductType
{
    const IS_NEW = 1;
    const IS_HOT = 2;
    const IS_GIFT = 4;
    const IS_PROMOTE = 8;
    const IS_GROUP = 16;

    public $id;
    public $label;

    public function __construct($id = null)
    {
        if ($id !== null) {
            $this->id = $id;
            $this->label = $this->getLabel($id);
        }
    }

    public static function labels($id = null)
    {
        $data = [
            self::IS_NEW => Yii::t('app', 'IS_NEW'),
            self::IS_HOT => Yii::t('app', 'IS_HOT'),
            self::IS_GIFT => Yii::t('app', 'IS_GIFT'),
            self::IS_PROMOTE => Yii::t('app', 'IS_PROMOTE'),
            self::IS_GROUP => Yii::t('app', 'IS_GROUP'),
        ];

        if ($id === null) {
            return $data;
        } else {
            $str = '';
            foreach ($data as $k => $v) {
                if ($k & $id) {
                    $str .= ' ' . $data[$k];
                }
            }
            return $str;
        }
    }

    public function getLabel($id)
    {
        $labels = self::labels();
        return isset($labels[$id]) ? $labels[$id] : null;
    }

    public static function arrayToInt($array)
    {
        if (!is_array($array) || !count($array)) {
            return 0;
        }

        $value = 0;
        foreach ($array as $v) {
            $value |= $v;
        }
        return $value;
    }

    public static function intToArray($i = 0)
    {
        if (!$i) {
            return [];
        }

        $array = [];
        foreach (self::labels() as $k => $v) {
            if ($k & $i) {
                $array[$k] = $k;
            }
        }
        return $array;
    }

}
