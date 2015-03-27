<?php

namespace frontend\controllers;

use common\models\Comment;
use common\models\Consultation;
use common\models\Favorite;
use common\models\SearchLog;
use common\models\Status;
use Yii;
use common\models\Category;
use common\models\Product;
use yii\data\ActiveDataProvider;
use yii\db\Query;
use yii\helpers\ArrayHelper;
use yii\web\BadRequestHttpException;
use yii\web\Cookie;
use yii\web\NotFoundHttpException;
use yii\web\Response;

class ProductController extends \frontend\components\Controller
{
    const PRODUCT_SORT_CREATED_AT = 1;
    const PRODUCT_SORT_SALES = 2;

    public function actionView($id)
    {
        $model = $this->findModel($id);

        $allCategory = Category::find()->asArray()->all();
        $arrayCategoryIdName = ArrayHelper::map($allCategory, 'id', 'name');
        $rootCategoryId = Category::getRootCatalogId($model->category_id, $allCategory);
        $arraySameRootCategory = Category::getArraySubCatalogId($rootCategoryId, $allCategory);

        // 同类商品  和 同大类商品
        $sameCategoryProducts = Product::find()->where(['category_id' => $model->category_id])->orderBy(['sales' => SORT_DESC])->limit(3)->all();
        $sameRootCategoryProducts = Product::find()->where(['category_id' => $arraySameRootCategory])->orderBy(['sales' => SORT_DESC])->limit(Yii::$app->params['productHotCount'])->all();

        // 记录浏览日志
        $historyProducts = [];
        $cookies = Yii::$app->request->cookies;
        if ($cookies->has('productHistory')) {
            $arrHistory = explode(',', $cookies->getValue('productHistory'));

            foreach ($arrHistory as $id) {
                $product = Product::findOne($id);
                if ($product) {
                    array_push($historyProducts, $product);
                }
            }

            array_unshift($arrHistory, $id);
            $arrHistory = array_unique($arrHistory);
            while (count($arrHistory) > Yii::$app->params['productHistoryCount']) {
                array_pop($arrHistory);
            }
            Yii::$app->response->cookies->remove('productHistory');
            Yii::$app->response->cookies->add(new Cookie([
                'name' => 'productHistory',
                'value' => implode(',', $arrHistory),
                'expire' => time() + 3600 * 24 * 30,
            ]));
        } else {
            Yii::$app->response->cookies->add(new Cookie([
                'name' => 'productHistory',
                'value' => $id,
                'expire' => time() + 3600 * 24 * 30,
            ]));
        }

        return $this->render('view', [
            'model' => $model,
            'allCategory' => $allCategory,
            'arrayCategoryIdName' => $arrayCategoryIdName,
            'sameCategoryProducts' => $sameCategoryProducts,
            'sameRootCategoryProducts' => $sameRootCategoryProducts,
            'historyProducts' => $historyProducts,
        ]);
    }

    public function actionSearch($keyword = null, $type = self::PRODUCT_SORT_CREATED_AT)
    {
        if ($type == self::PRODUCT_SORT_CREATED_AT) {
            $type = 'created_at';
        } elseif ($type == self::PRODUCT_SORT_SALES) {
            $type = 'sales';
        } else {
            throw new BadRequestHttpException('Type is not supported.');
        }

        if (trim($keyword)) {
            $keyword = trim($keyword);
            $searchLog = new SearchLog([
                'session_id' => Yii::$app->session->id,
                'user_id' => Yii::$app->user->id,
                'keyword' => $keyword,
                'ip' => Yii::$app->request->userIP,
            ]);
            $searchLog->save();

            $query = Product::find()->where('name like "%' . $keyword . '%"');
        } else {
            $query = Product::find();
        }
        $query->orderBy(['sales' => SORT_DESC]);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeProduct']],
            'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
        ]);

        return $this->render('search', [
            'products' => $dataProvider->getModels(),
            'pagination' => $dataProvider->pagination,
        ]);

    }

    public function actionFavorite($id)
    {
        if (!Yii::$app->user->isGuest) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            $favorite = Favorite::find()->where(['user_id' => Yii::$app->user->id, 'product_id' => $id])->one();
            if (!$favorite) {
                $model = new Favorite([
                    'user_id' => Yii::$app->user->id,
                    'product_id' => $id,
                ]);

                if ($model->save()) {
                    return [
                        'status' => 1,
                    ];
                }
            }
            return [
                'status' => 2,
            ];
        } else {
            return $this->redirect('site/login');
        }
    }

    public function actionComment($productId)
    {
        $this->layout = false;
        if (Yii::$app->request->isAjax && $productId) {
            $query = Comment::find()->where(['product_id' => $productId, 'status' => Status::STATUS_ACTIVE]);
            $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeProduct']],
                'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
            ]);

            return $this->render('comment', [
                'data' => $dataProvider->getModels(),
                'pagination' => $dataProvider->pagination,
            ]);
        }
    }

    public function actionConsultation($productId)
    {
        $this->layout = false;
        if (Yii::$app->request->isAjax && $productId) {
            $query = Consultation::find()->where(['product_id' => $productId, 'status' => Status::STATUS_ACTIVE]);
            $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeProduct']],
                'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
            ]);

            return $this->render('consultation', [
                'data' => $dataProvider->getModels(),
                'pagination' => $dataProvider->pagination,
            ]);
        }
    }

    /**
     * Finds the Category model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Category the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Product::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
