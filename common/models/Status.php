<?php
/**
 * Common Status Class
Usage:
model.php
private $_status;
public function getStatus()
{
	if ($this->_status === null) {
		$this->_status = new Status($this->status);
	}
	return $this->_status;
}
 
index.php 
[
	'attribute' => 'status',
	'format' => 'html',
	'value' => function ($model) {
			if ($model->status === Status::STATUS_ACTIVE) {
				$class = 'label-success';
			} elseif ($model->status === Status::STATUS_INACTIVE) {
				$class = 'label-warning';
			} else {
				$class = 'label-danger';
			}

			return '<span class="label ' . $class . '">' . $model->getStatus()->label . '</span>';
		},
	'filter' => Html::activeDropDownList(
			$searchModel,
			'status',
			Status::labels(),
			['class' => 'form-control', 'prompt' => Yii::t('app', 'Please Select')]
		)
],

_form.php
<?= $form->field($model, 'status')->dropDownList(\common\models\Status::labels()) ?>

view.php
[
	'attribute' => 'status',
	'value' => $model->getStatus()->label,
],

 */

namespace common\models;

use Yii;

class Status
{
    const STATUS_INACTIVE = 0;
    const STATUS_ACTIVE = 1;
    const STATUS_DELETED = -1;

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
            self::STATUS_ACTIVE => Yii::t('app', 'STATUS_ACTIVE'),
            self::STATUS_INACTIVE => Yii::t('app', 'STATUS_INACTIVE'),
            self::STATUS_DELETED => Yii::t('app', 'STATUS_DELETED'),
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
