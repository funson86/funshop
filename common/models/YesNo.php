<?php
/**
 * Common Status Class
 * User: funson
 * Date: 2014/06/25
 * Time: 9:50
 */

namespace common\models;

use funson86\cms\Module;

class YesNo
{
    const NO = 0;
    const YES = 1;

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
            self::YES => Module::t('cms', 'YES'),
            self::NO => Module::t('cms', 'NO'),
        ];

        if ($id !== null && isset($data[$id])) {
            return $data[$id];
        } else {
            return $data;
        }
    }

    public function getLabel($id)
    {
        $labels = self::labels();
        return isset($labels[$id]) ? $labels[$id] : null;
    }

}
