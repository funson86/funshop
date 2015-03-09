<?php

namespace frontend\controllers;

use common\models\Consultation;
use common\models\ConsultationSearch;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\web\Response;

class ConsultationController extends \frontend\components\Controller
{
    public $layout = 'column2';

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ],
        ];
    }

    public function actionIndex()
    {
        $query = Consultation::find()->where(['user_id' => Yii::$app->user->id]);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeOrder']],
            'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
        ]);

        return $this->render('index', [
            'models' => $dataProvider->getModels(),
            'pagination' => $dataProvider->pagination,
        ]);
    }

    public function actionView()
    {
        return $this->render('view');
    }

    public function actionAjaxAdd()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        if (Yii::$app->request->post('productId') && Yii::$app->request->post('question')) {

            $model = new Consultation();
            $model->user_id = Yii::$app->user->id;
            $model->username = Yii::$app->user->identity->username;
            $model->product_id = Yii::$app->request->post('productId');
            $model->question = Yii::$app->request->post('question');

            if ($model->save()) {
                return [
                    'status' => 1,
                ];
            } else {
                return [
                    'status' => -2,
                ];
            }

        }
        return [
            'status' => -1,
        ];
    }

}
