<?php
namespace backend\controllers;

use common\models\User;
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
                        'actions' => ['logout', 'index', 'change-password'],
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
        $lastWeekStart = mktime(0, 0, 0, date('m'), date('d') - date('w') + 1 - 7, date('Y'));
        $lastWeekEnd = mktime(23, 59, 59, date('m'), date('d') - date('w') + 7 - 7, date('Y'));
        $thisWeekStart = mktime(0, 0, 0, date('m'), date('d') - date('w') + 1, date('Y'));
        $thisWeekEnd = mktime(23, 59, 59, date('m'), date('d') - date('w') + 7, date('Y'));
        $lastMonthStart = mktime(0, 0, 0, date('m') -1, 1, date('Y'));
        $lastMonthEnd = mktime(0, 0, 0, date('m'), 1, date('Y')) - 1;
        $thisMonthStart = mktime(0, 0, 0, date('m'), 1, date('Y'));
        $thisMonthEnd = mktime(0, 0, 0, date('m') + 1, 1, date('Y')) - 1;

        // Order Stat
        $query = new Query();
        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $todayStart . '', 'created_at <= ' . $todayEnd])->createCommand()->queryOne();
        $dataOrder['todayCount'] = $result['count'];
        $dataOrder['todayAmount'] = floatval($result['amount']);

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $yesterdayStart . '', 'created_at <= ' . $yesterdayEnd])->createCommand()->queryOne();
        $dataOrder['yesterdayCount'] = $result['count'];
        $dataOrder['yesterdayAmount'] = floatval($result['amount']);

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $lastWeekStart . '', 'created_at <= ' . $lastWeekEnd])->createCommand()->queryOne();
        $dataOrder['lastWeekCount'] = $result['count'];
        $dataOrder['lastWeekAmount'] = floatval($result['amount']);

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $thisWeekStart . '', 'created_at <= ' . $thisWeekEnd])->createCommand()->queryOne();
        $dataOrder['thisWeekCount'] = $result['count'];
        $dataOrder['thisWeekAmount'] = floatval($result['amount']);

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $lastMonthStart . '', 'created_at <= ' . $lastMonthEnd])->createCommand()->queryOne();
        $dataOrder['lastMonthCount'] = $result['count'];
        $dataOrder['lastMonthAmount'] = floatval($result['amount']);

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $thisMonthStart . '', 'created_at <= ' . $thisMonthEnd])->createCommand()->queryOne();
        $dataOrder['thisMonthCount'] = $result['count'];
        $dataOrder['thisMonthAmount'] = floatval($result['amount']);

        // User Stat
        $result = $query->select('count(*) as count')->from('user')->where(['and', 'created_at > ' . $todayStart . '', 'created_at <= ' . $todayEnd])->createCommand()->queryOne();
        $dataUser['todayCount'] = $result['count'];

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $yesterdayStart . '', 'created_at <= ' . $yesterdayEnd])->createCommand()->queryOne();
        $dataUser['yesterdayCount'] = $result['count'];

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $lastWeekStart . '', 'created_at <= ' . $lastWeekEnd])->createCommand()->queryOne();
        $dataUser['lastWeekCount'] = $result['count'];

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $thisWeekStart . '', 'created_at <= ' . $thisWeekEnd])->createCommand()->queryOne();
        $dataUser['thisWeekCount'] = $result['count'];

        $result = $query->select('count(*) as count, sum(amount) as amount')->from('order')->where(['and', 'created_at > ' . $lastMonthStart . '', 'created_at <= ' . $lastMonthEnd])->createCommand()->queryOne();
        $dataUser['lastMonthCount'] = $result['count'];

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

    public function actionChangePassword()
    {
        $model = new \backend\models\User(['scenario' => 'admin-change-password']);

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $user = User::findOne(Yii::$app->user->identity->id);
            $user->setPassword($model->password);
            $user->generateAuthKey();
            if ($user->save()) {
                Yii::$app->getSession()->setFlash('success', Yii::t('app', 'New password was saved.'));
            }
            return $this->redirect(['change-password']);
        }

        return $this->render('changePassword', [
            'model' => $model,
        ]);
    }
}
