<?php
namespace backend\controllers;

use Yii;
use yii\db\Query;
use yii\filters\AccessControl;
use yii\web\Controller;
use common\models\LoginForm;
use yii\filters\VerbFilter;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionIndex()
    {
        $todayStart = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
        $todayEnd = mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')) - 1;
        $yesterdayStart = mktime(0, 0, 0, date('m'), date('d') - 1, date('Y'));
        $yesterdayEnd = mktime(0, 0, 0, date('m'), date('d'), date('Y')) - 1;
        $thisMonthStart = mktime(0, 0, 0, date('m'), 1, date('Y'));
        $thisMonthEnd = mktime(0, 0, 0, date('m') + 1, 1, date('Y')) - 1;

        // Order Stat
        $query = new Query();
        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $todayStart . '', 'created_at <= ' . $todayEnd])->createCommand()->queryOne();
        $dataOrder['todayCount'] = $result['count'];
        $dataOrder['todayAmount'] = floatval($result['amount']);

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $thisMonthStart . '', 'created_at <= ' . $thisMonthEnd])->createCommand()->queryOne();
        $dataOrder['thisMonthCount'] = $result['count'];
        $dataOrder['thisMonthAmount'] = floatval($result['amount']);

        // User Stat
        $result = $query->select('count(*) as count')->from('user')->where(['and', 'created_at > ' . $todayStart . '', 'created_at <= ' . $todayEnd])->createCommand()->queryOne();
        $dataUser['todayCount'] = $result['count'];

        $result = $query->select('count(*) as count')->from('user')->where(['and', 'created_at > ' . $thisMonthStart . '', 'created_at <= ' . $thisMonthEnd])->createCommand()->queryOne();
        $dataUser['thisMonthCount'] = $result['count'];

        return $this->render('index', [
            'dataOrder' => $dataOrder,
            'dataUser' => $dataUser,
        ]);
    }

    public function actionLogin()
    {
        $this->layout = 'guest';

        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
