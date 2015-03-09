<?php

namespace frontend\controllers;

use Yii;
use common\models\Category;
use common\models\Product;
use common\models\Status;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;

class CategoryController extends \frontend\components\Controller
{
    public function actionView($id)
    {
        if ($id <= 0)
            $this->goHome();

        $allCategory = Category::find()->asArray()->all();
        $arrayCategoryIdName = ArrayHelper::map($allCategory, 'id', 'name');
        $arrSubCat = Category::getArraySubCatalogId($id, $allCategory);
        $query = Product::find()->where(['category_id' => $arrSubCat, 'status' => Status::STATUS_ACTIVE]);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['defaultPageSize' => Yii::$app->params['defaultPageSizeProduct']],
            'sort' => ['defaultOrder' => ['created_at' => SORT_DESC]],
        ]);

        return $this->render('view', [
            'model' => $this->findModel($id),
            'allCategory' => $allCategory,
            'arrayCategoryIdName' => $arrayCategoryIdName,
            'products' => $dataProvider->getModels(),
            'pagination' => $dataProvider->pagination,
        ]);
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
        if (($model = Category::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
