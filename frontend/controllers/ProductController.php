<?php

namespace frontend\controllers;

use common\models\Favorite;
use Yii;
use common\models\Category;
use common\models\Product;
use yii\data\ActiveDataProvider;
use yii\db\Query;
use yii\helpers\ArrayHelper;
use yii\web\BadRequestHttpException;
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

        $sameCategoryProducts = Product::find()->where(['category_id' => $model->category_id])->orderBy(['sales' => SORT_DESC])->limit(3)->all();
        $sameRootCategoryProducts = Product::find()->where(['category_id' => $arraySameRootCategory])->orderBy(['sales' => SORT_DESC])->limit(8)->all();

        return $this->render('view', [
            'model' => $model,
            'allCategory' => $allCategory,
            'arrayCategoryIdName' => $arrayCategoryIdName,
            'sameCategoryProducts' => $sameCategoryProducts,
            'sameRootCategoryProducts' => $sameRootCategoryProducts,
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

        if ($keyword) {
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
