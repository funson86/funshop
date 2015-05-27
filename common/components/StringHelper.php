<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace common\components;

/**
 * StringHelper
 *
 * @author Funson86 <funson86@gmail.com>
 * @since 2.0
 */
class StringHelper extends \yii\helpers\StringHelper
{
    /**
     * Hide usrname left first and last character.
     * eg 'funson86' hided to 'f***6'
     *
     * @param string $string
     * @return
     */
    public static function hideMiddle($string)
    {
        $string = trim($string);
        if (!strlen($string)) {
            return ;
        }

        $first = mb_substr($string, 0, 1);
        $last = mb_substr($string, -1, 1);

        return $first . '***' . $last;
    }

}