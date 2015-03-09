<?php

namespace backend\controllers;

use common\models\Bonus;
use common\models\Order;
use common\models\User;
use Yii;
use common\models\BonusType;
use common\models\BonusTypeSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * BonusTypeController implements the CRUD actions for BonusType model.
 */
class BonusTypeController extends Controller
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
     * Lists all BonusType models.
     * @return mixed
     */
    public function actionIndex()
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $searchModel = new BonusTypeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single BonusType model.
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
     * Displays a single BonusType model.
     * @param integer $id
     * @return mixed
     */
    public function actionSend($id)
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));
        if (Yii::$app->request->post()) {
            if (isset(Yii::$app->request->post('BonusType')['users'])) {
                $strUser = Yii::$app->request->post('BonusType')['users'];
                $arrayUser = explode(',', $strUser);

                foreach ($arrayUser as $user) {
                    $user = User::find()->where(['username' => $user])->one();
                    $userId = isset($user) ? $user->id : null;
                    $bonusType = BonusType::findOne($id);
                    if ($userId) {
                        $bonus = new Bonus();
                        $bonus->user_id = $userId;
                        $bonus->bonus_type_id = $id;
                        $bonus->money = $bonusType->money;
                        $bonus->min_amount = $bonusType->min_amount;
                        $bonus->started_at = $bonusType->started_at;
                        $bonus->ended_at = $bonusType->ended_at;
                        $bonus->user_id = $userId;
                        $bonus->save();
                    }
                }
            } elseif (isset(Yii::$app->request->post('BonusType')['numbers']) && Yii::$app->request->post('BonusType')['numbers'] > 0) {
                for ($i = 0; $i < Yii::$app->request->post('BonusType')['numbers']; $i++) {
                    $bonusType = BonusType::findOne($id);
                    $bonus = new Bonus();
                    $bonus->bonus_type_id = $id;
                    $bonus->money = $bonusType->money;
                    $bonus->min_amount = $bonusType->min_amount;
                    $bonus->started_at = $bonusType->started_at;
                    $bonus->ended_at = $bonusType->ended_at;
                    $bonus->sn = Yii::$app->security->generateRandomString(8);
                    $bonus->save();
                }
            }
            return $this->redirect(['bonus/index']);
        } else {
            $model = $this->findModel($id);

            if ($model->type == BonusType::BONUS_TYPE_AMOUNT) {
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
     * Creates a new BonusType model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //if(!Yii::$app->user->can('createYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = new BonusType();
        $model->loadDefaultValues();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing BonusType model.
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
     * Deletes an existing BonusType model.
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
     * Finds the BonusType model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return BonusType the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = BonusType::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
