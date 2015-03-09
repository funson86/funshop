<?php

namespace frontend\controllers;

use common\models\Order;
use common\models\OrderProduct;
use Yii;
use common\models\Comment;
use common\models\CommentSearch;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * CommentController implements the CRUD actions for Comment model.
 */
class CommentController extends Controller
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

    /**
     * Lists all Comment models.
     * @return mixed
     */
    public function actionIndex()
    {
        $commentedOrders = Comment::find()->where(['user_id' => Yii::$app->user->id])->all();
        $orderIds = ArrayHelper::map($commentedOrders, 'order_id', 'order_id');
        $productIds = ArrayHelper::map($commentedOrders, 'order_id', 'product_id');

        if (count($orderIds) && count($productIds)) {
            $ids = [];
            foreach ($productIds as $orderId => $productId) {
                $orderProduct = OrderProduct::find()->where(['and', 'user_id = ' . Yii::$app->user->id, 'order_id = ' . $orderId, 'product_id = ' . $productId])->one();
                $ids[] = $orderProduct->id;
            }
            $query = OrderProduct::find()->where(['and', 'user_id = ' . Yii::$app->user->id, ['not in', 'id', $ids]]);
        } else {
            $query = OrderProduct::find()->where(['user_id' => Yii::$app->user->id]);
        }

        $query->orderBy(['created_at' => SORT_DESC]);

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

    /**
     * Lists all Comment models.
     * @return mixed
     */
    public function actionCommented()
    {
        $query = Comment::find()->where(['user_id' => Yii::$app->user->id])->orderBy(['created_at' => SORT_DESC]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeOrder']],
            'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
        ]);

        return $this->render('commented', [
            'models' => $dataProvider->getModels(),
            'pagination' => $dataProvider->pagination,
        ]);
    }

    /**
     * Displays a single Comment model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Comment model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Comment();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Comment model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
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
     * Deletes an existing Comment model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }


    public function actionAjaxAdd()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        if (Yii::$app->request->get('product_id') && Yii::$app->request->get('order_id') && Yii::$app->request->get('star') && Yii::$app->request->get('content')) {

            $model = new Comment();
            $model->user_id = Yii::$app->user->id;
            $model->username = Yii::$app->user->identity->username;
            $model->product_id = Yii::$app->request->get('product_id');
            $model->order_id = Yii::$app->request->get('order_id');
            $model->star = Yii::$app->request->get('star');
            $model->content = Yii::$app->request->get('content');

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

    public function actionAjaxUp()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $id = Yii::$app->request->get('id');
        if ($id) {
            $model = $this->findModel($id);
            $model->up += 1;

            if ($model->save()) {
                return [
                    'status' => 1,
                    'up' => $model->up,
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

    /**
     * Finds the Comment model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Comment the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Comment::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
