<?php

namespace frontend\controllers;

use common\models\Coupon;
use common\models\Order;
use common\models\PointLog;
use common\models\Product;
use common\models\Profile;
use frontend\models\ChangePasswordForm;
use Yii;
use common\models\Favorite;
use yii\base\InvalidParamException;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;
use yii\web\BadRequestHttpException;
use yii\web\Response;

class UserController extends \frontend\components\Controller
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
        $orders = Order::find()->where(['user_id' => Yii::$app->user->id])->limit(2)->all();

        $productIds = ArrayHelper::map(Favorite::find()->where(['user_id' => Yii::$app->user->id])->orderBy(['id' => SORT_DESC])->asArray()->all(), 'product_id', 'product_id');
        if (count($productIds)) {
            $favorites = Product::find()->where(['id' => $productIds])->limit(5)->all();
        }

        $coupons = Coupon::find()->where(['and', 'user_id = ' . Yii::$app->user->id, 'used_at = 0', 'ended_at >= ' . time()])->all();

        return $this->render('index', [
            'orders' => $orders,
            'favorites' => isset($favorites) ? $favorites : null,
            'coupons' => $coupons,
        ]);
    }

    public function actionFavorite()
    {
        $productIds = ArrayHelper::map(Favorite::find()->where(['user_id' => Yii::$app->user->id])->orderBy(['id' => SORT_DESC])->asArray()->all(), 'product_id', 'product_id');
        if (count($productIds)) {
            $query = Product::find()->where(['id' => $productIds]);
            $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeOrder']],
                'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
            ]);

            return $this->render('favorite', [
                'products' => $dataProvider->getModels(),
                'pagination' => $dataProvider->pagination,
            ]);
        }

        return $this->render('favorite', [
            'products' => [],
        ]);
    }

    public function actionChangePassword()
    {
        try {
            $model = new ChangePasswordForm();
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->changePassword()) {
            Yii::$app->getSession()->setFlash('success', Yii::t('app', 'New password was saved.'));
            return $this->redirect(['change-password']);
        }

        return $this->render('changePassword', [
            'model' => $model,
        ]);
    }

    public function actionPointLog()
    {
        $query = PointLog::find()->where(['user_id' => Yii::$app->user->id]);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeOrder']],
            'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
        ]);

        return $this->render('point-log', [
            'models' => $dataProvider->getModels(),
            'pagination' => $dataProvider->pagination,
        ]);
    }

    public function actionCoupon($type = 1)
    {
        $now = time();
        if ($type == 1) {
            $query = Coupon::find()->where(['and', 'user_id = ' . Yii::$app->user->id, 'used_at = 0', 'ended_at >= ' . $now]);
        } elseif ($type == 2) {
            $query = Coupon::find()->where(['and', 'user_id = ' . Yii::$app->user->id, 'used_at > 0']);
        } elseif ($type == 3) {
            $query = Coupon::find()->where(['and', 'user_id = ' . Yii::$app->user->id, 'ended_at < ' . $now]);
        }
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeOrder']],
            'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
        ]);

        return $this->render('coupon', [
            'models' => $dataProvider->getModels(),
            'pagination' => $dataProvider->pagination,
        ]);
    }

    public function actionProfile()
    {
        $model = Profile::findOne(['user_id' => Yii::$app->user->id]);
        if (!$model) {
            $model = new Profile();
            $model->user_id = Yii::$app->user->id;
        }

        if ($model->birthday) {
            $model->year = substr($model->birthday, 0, 4);
            $model->month = substr($model->birthday, 5, 2);
            $model->day = substr($model->birthday, 8, 2);
        }

        if ($model->load(Yii::$app->request->post())) {
            $model->year = intval(Yii::$app->request->post()['Profile']['year']);
            $model->month = intval(Yii::$app->request->post()['Profile']['month']);
            $model->day = intval(Yii::$app->request->post()['Profile']['day']);
            if ($model->year || $model->month || $model->day) {
                $model->birthday = date('Y-m-d H:i:s', mktime(0, 0, 0, $model->month, $model->day, $model->year));
            }

            if ($model->save()) {
                Yii::$app->getSession()->setFlash('success', Yii::t('app', 'New profile was saved.'));
            }
        }

        return $this->render('profile', [
            'model' => $model,
        ]);
    }

    public function actionAjaxDeleteFavorite($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        if ($id) {
            Favorite::deleteAll(['user_id' => Yii::$app->user->id, 'product_id' => $id]);
            return [
                'status' => 1,
            ];
        }
        return [
            'status' => -1,
        ];
    }

}
