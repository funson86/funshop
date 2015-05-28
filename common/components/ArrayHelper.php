<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace common\components;

/**
 * ArrayHelper
 *
 * @author Funson86 <funson86@gmail.com>
 * @since 2.0
 */
class ArrayHelper extends \yii\helpers\ArrayHelper
{
    /**
     * convert the key of underscore to camel case.
     * $array = [
     *     ['parent_id' => '123', 'update_at' => 'abc'],
     *     ['parent_id' => '345', 'update_at' => 'def'],
     * ];
     *
     * $result = ArrayHelper::keyToCamel($array);
     * The result is:
     * [
     *     ['parentId' => '123', 'updateAt' => 'abc'],
     *     ['parentId' => '345', 'updateAt' => 'def'],
     * ];
     *
     * @param string $string
     * @return
     */
    public static function keyToCamel($array)
    {
        $result = [];
        foreach ($array as $k => $element) {
            if (is_array($element)) {
                $value = self::keyToCamel($element);
                $newKey = lcfirst(str_replace(' ', '', ucwords(implode(' ', explode('_', $k)))));
                $result[$newKey] = $value;
            } else {
                $newKey = lcfirst(str_replace(' ', '', ucwords(implode(' ', explode('_', $k)))));
                $result[$newKey] = $element;
            }
        }
        return $result;
    }

}