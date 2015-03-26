<?php

namespace frontend\controllers;

use common\models\Brand;
use Yii;
use common\models\Category;
use common\models\Product;
use common\models\Status;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;
use yii\db\Query;

class CategoryController extends \frontend\components\Controller
{
    public function actionView($id)
    {
        if ($id <= 0)
            $this->goHome();

        $allCategory = Category::find()->asArray()->all();
        $arrayCategoryIdName = ArrayHelper::map($allCategory, 'id', 'name');
        $arrSubCat = Category::getArraySubCatalogId($id, $allCategory);

        /****** 价格筛选 ****/
        $result = (new Query())->select('min(price) as min, max(price) as max')->from('product')->where(['category_id' => $arrSubCat, 'status' => Status::STATUS_ACTIVE])->one();
        $min = $result['min'];
        $max = $result['max'];
        if ($max > $min && $max > 0) {
            // 计算跨度
            $priceGrade = 0.0001;
            for ($i = -2; $i < log10($max); $i++) {
                $priceGrade *= 10;
            }
            $span = ceil(($max - $min) / 5 / $priceGrade) * $priceGrade;
            if ($span == 0)
                $span = $priceGrade;

            // 计算价格的起点和终点
            for($i = 1; $min > $span * $i; $i++);
            for($j = 1; $min > ($span * ($i - 1) + $priceGrade * $j); $j++);

            $priceFilter['start'] = $span * ($i - 1) + $priceGrade * ($j - 1);
            for(; $max >= $span * $i; $i++);
            $priceFilter['end'] = $span * ($i) + $priceGrade * ($j - 1);
            $priceFilter['span'] = $span;
        }
        /****** 价格筛选 end ****/

        /****** 品牌筛选 start ****/
        $result = (new Query())->select('distinct(brand_id)')->from('product')->where(['category_id' => $arrSubCat, 'status' => Status::STATUS_ACTIVE])->all();
        $ids = ArrayHelper::map($result, 'brand_id', 'brand_id');
        $brandFilter = Brand::find()->where(['id' => $ids])->orderBy(['name' => SORT_ASC])->all();
        /****** 品牌筛选 end ****/

        $query = Product::find()->where(['category_id' => $arrSubCat, 'status' => Status::STATUS_ACTIVE]);

        // 如果选择了价格区间
        if (Yii::$app->request->get('max')) {
            $min = intval(Yii::$app->request->get('min'));
            $max = intval(Yii::$app->request->get('max'));
            if ($min >= 0 && $max) {
                $query->andWhere(['and', ['>', 'price', $min], ['<=', 'price', $max]]);
            }
        }

        // 如果选择了品牌
        if (Yii::$app->request->get('brand_id')) {
            $brandId = intval(Yii::$app->request->get('brand_id'));
            if ($brandId >= 0) {
                $query->andWhere(['brand_id' => $brandId]);
            }
        }

        // 侧边热销商品
        $sameCategoryProducts = Product::find()->where(['category_id' => $id])->orderBy(['sales' => SORT_DESC])->limit(5)->all();

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
            'priceFilter' => isset($priceFilter) ? $priceFilter : null,
            'brandFilter' => $brandFilter,
            'sameCategoryProducts' => $sameCategoryProducts,
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
