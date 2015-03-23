<?php

namespace backend\controllers;

use backend\widgets\image\RemoveAction;
use backend\widgets\image\UploadAction;
use common\models\ProductImage;
use common\models\ProductType;
use Yii;
use common\models\Product;
use common\models\ProductSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * ProductController implements the CRUD actions for Product model.
 */
class ProductController extends Controller
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

    public function actions()
    {
        return [
            'upload' => [
                'class' => UploadAction::className(),
                'upload' => 'upload',
            ],
            'remove' => [
                'class' => RemoveAction::className(),
                'uploadDir' => '@frontend/web/upload',
            ],
        ];
    }


    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionIndex()
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Product model.
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
     * Creates a new Product model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //if(!Yii::$app->user->can('createYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = new Product();
        $model->loadDefaultValues();

        if ($model->load(Yii::$app->request->post())) {
            $model->type = ProductType::arrayToInt($model->type);
            if ($model->save()) {
                return $this->redirect(['update', 'id' => $model->id]);
            }
       }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //if(!Yii::$app->user->can('updateYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
            $model->type = ProductType::arrayToInt($model->type);
            if ($model->save()) {
                if (isset(Yii::$app->request->post()['imageSort'])) {
                    foreach (Yii::$app->request->post()['imageSort'] as $key => $sortOrder) {
                        ProductImage::updateAll(['sort_order' => $sortOrder], ['id' => $key]);
                    }
                }

                $productImage = ProductImage::find()->where(['product_id' => $id])->orderBy(['sort_order' => SORT_ASC])->one();
                if ($productImage) {
                    $model->image = $productImage->image;
                    $model->thumb = $productImage->thumb;
                    $model->save();
                }

                return $this->redirect(['view', 'id' => $model->id]);
            }
        }

        $model->type = ProductType::intToArray($model->type);
        return $this->render('update', [
            'model' => $model,
        ]);

    }

    /**
     * Deletes an existing Product model.
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
     * Finds the Product model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Product the loaded model
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

    /**
     * batch import product
     * @param integer $id
     * @return mixed
     */
    public function actionImport()
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        return $this->render('import', [

        ]);
    }

    /**
     * batch export product
     * @param integer $id
     * @return mixed
     */
    public function actionExport()
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));
        $format = ['id', 'category_id', 'name', 'sku', 'weight', 'market_price', 'price', 'brief', 'content', 'thumb', 'image', 'keywords', 'description', 'type'];

        $products = Product::find()->orderBy(['id' => SORT_DESC])->all();

        $str = '';

        // 生成csv标题行
        $product = new Product();
        $start = true;
        foreach ($format as $column) {
            if ($start) {
                $str .= '"' . iconv('utf-8', 'gb2312', $product->attributeLabels()[$column]) . '"';
                $start = false;
            } else {
                $str .= ',"' . iconv('utf-8', 'gb2312', $product->attributeLabels()[$column]) . '"';
            }
        }
        $str .= ',' . iconv('utf-8', 'gb2312', Yii::t('app', 'Thumbs')) . ',' . iconv('utf-8', 'gb2312', Yii::t('app', 'Images'));
        $str .= "\n";

        foreach ($products as $row) {
            // 导出 product表中的数据
            $start = true;
            foreach ($format as $column) {
                $value = iconv('utf-8', 'gb2312', $row[$column]);
                if ($start) {
                    $str .= '"' . $value . '"';
                    $start = false;
                } else {
                    $str .= ',"' . $value . '"';
                }
            }

            // 导出product_image表中的数据
            $start = true;
            $strThumb = $strImage = '';
            $productImages = ProductImage::find()->where(['product_id' => $row->id])->all();
            foreach ($productImages as $item) {
                if ($start) {
                    $strThumb .= $item->thumb;
                    $strImage .= $item->image;
                    $start = false;
                } else {
                    $strThumb .= '|' . $item->thumb;
                    $strImage .= '|' . $item->image;
                }
            }
            $str .= ',"' . $strThumb . '","' . $strImage . '"';

            $str .= "\n";
        }

        $filename = date('Ymd').'.csv';

        header("Content-type:text/csv");
        header("Content-Disposition:attachment;filename=".$filename);
        header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
        header('Expires:0');
        header('Pragma:public');
        echo $str;
    }



}
