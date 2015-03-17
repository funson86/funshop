<?php

namespace backend\controllers;

use common\models\Coupon;
use common\models\Order;
use common\models\User;
use Yii;
use common\models\CouponType;
use common\models\CouponTypeSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * CouponTypeController implements the CRUD actions for CouponType model.
 */
class CouponTypeController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
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

    /**
     * Lists all CouponType models.
     * @return mixed
     */
    public function actionIndex()
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $searchModel = new CouponTypeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CouponType model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));
        
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Displays a single CouponType model.
     * @param integer $id
     * @return mixed
     */
    public function actionSend($id)
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));
        if (Yii::$app->request->post()) {
            if (isset(Yii::$app->request->post('CouponType')['users'])) {
                $strUser = Yii::$app->request->post('CouponType')['users'];
                $arrayUser = explode(',', $strUser);

                foreach ($arrayUser as $user) {
                    $user = User::find()->where(['username' => $user])->one();
                    $userId = isset($user) ? $user->id : null;
                    $couponType = CouponType::findOne($id);
                    if ($userId) {
                        $coupon = new Coupon();
                        $coupon->user_id = $userId;
                        $coupon->coupon_type_id = $id;
                        $coupon->money = $couponType->money;
                        $coupon->min_amount = $couponType->min_amount;
                        $coupon->started_at = $couponType->started_at;
                        $coupon->ended_at = $couponType->ended_at;
                        $coupon->user_id = $userId;
                        $coupon->save();
                    }
                }
            } elseif (isset(Yii::$app->request->post('CouponType')['numbers']) && Yii::$app->request->post('CouponType')['numbers'] > 0) {
                for ($i = 0; $i < Yii::$app->request->post('CouponType')['numbers']; $i++) {
                    $couponType = CouponType::findOne($id);
                    $coupon = new Coupon();
                    $coupon->coupon_type_id = $id;
                    $coupon->money = $couponType->money;
                    $coupon->min_amount = $couponType->min_amount;
                    $coupon->started_at = $couponType->started_at;
                    $coupon->ended_at = $couponType->ended_at;
                    $coupon->sn = Yii::$app->security->generateRandomString(8);
                    $coupon->save();
                }
            }
            return $this->redirect(['coupon/index']);
        } else {
            $model = $this->findModel($id);

            if ($model->type == CouponType::COUPON_TYPE_AMOUNT) {
                $arrayUserId = ArrayHelper::map(Order::find()->where('amount > :amount', [':amount' => $model->min_goods_amount])->all(), 'user_id', 'user_id');
                $arrayUserName = ArrayHelper::map(User::find()->where(['id' => $arrayUserId])->all(), 'id', 'username');

                $model->users = implode(',', $arrayUserName);
            }

            return $this->render('sendForm', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Creates a new CouponType model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //if(!Yii::$app->user->can('createYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = new CouponType();
        $model->loadDefaultValues();

        if ($model->load(Yii::$app->request->post())) {
            $model->started_at = strtotime($model->started_at);
            $model->ended_at = strtotime($model->ended_at) + 86400 - 1;
            $model->save();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing CouponType model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //if(!Yii::$app->user->can('updateYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing CouponType model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        //if(!Yii::$app->user->can('deleteYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $this->findModel($id)->delete();
        /*$model = $this->findModel($id);
        $model->status = Status::STATUS_DELETED;
        $model->save();*/

        return $this->redirect(['index']);
    }

    /**
     * Finds the CouponType model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CouponType the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CouponType::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
