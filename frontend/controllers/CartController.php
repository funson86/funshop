<?php

namespace frontend\controllers;

use common\models\Address;
use common\models\Cart;
use common\models\Coupon;
use common\models\Order;
use common\models\OrderProduct;
use common\models\Product;
use Yii;
use yii\filters\AccessControl;
use yii\web\NotFoundHttpException;
use yii\web\Response;

class CartController extends \frontend\components\Controller
{
    public $layout = 'cart';

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['checkout', 'address', 'pay', 'cod', 'json-coupon'],
                'rules' => [
                    [
                        'actions' => ['checkout', 'address', 'pay', 'cod', 'json-coupon'],
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ],
        ];
    }

    public function actionIndex()
    {
        Yii::$app->session['step'] = 1;

        if (Yii::$app->request->get('minus') || Yii::$app->request->get('add') || (Yii::$app->request->get('change') && Yii::$app->request->get('value'))) {
            if (Yii::$app->request->get('minus')) {
                $productId = Yii::$app->request->get('minus');
                Cart::updateAllCounters(['number' => -1], ['session_id' => Yii::$app->session->id, 'product_id' => $productId]);
            } elseif (Yii::$app->request->get('add')) {
                $productId = Yii::$app->request->get('add');
                Cart::updateAllCounters(['number' => 1], ['session_id' => Yii::$app->session->id, 'product_id' => $productId]);
            } elseif (Yii::$app->request->get('change') && Yii::$app->request->get('value')) {
                $productId = Yii::$app->request->get('change');
                $value = Yii::$app->request->get('value');
                Cart::updateAll(['number' => $value], ['session_id' => Yii::$app->session->id, 'product_id' => $productId]);
            }
            Cart::deleteAll('number <= 0');
            return;
        }

        $products = Cart::find()->where(['session_id' => Yii::$app->session->id])->all();
        if (count($products)) {
            return $this->render('index', [
                'products' => $products,
            ]);
        } else {
            return $this->render('cart-no-product', [
                'products' => $products,
            ]);
        }
    }

    public function actionCheckout()
    {
        Yii::$app->session['step'] = 2;

        $userId = Yii::$app->user->id;
        $addresses = Address::find()->where(['user_id' => $userId])->all();

        $model = new Order();

        if ($model->load(Yii::$app->request->post())) {
            var_dump(Yii::$app->request->post(), $model);die();
            $address = Address::find()->where(['id' => $userId, 'user_id' => $userId])->one();
            $model->user_id = $userId;
            $model->sn = date('YmdHis') . rand(1000, 9999);
            $model->consignee = $address->consignee;
            $model->country = $address->country;
            $model->province = $address->province;
            $model->city = $address->city;
            $model->district = $address->district;
            $model->address = $address->address;
            $model->zipcode = $address->zipcode;
            $model->phone = $address->phone;
            $model->mobile = $address->mobile;
            $model->email = $address->email ? $address->email : Yii::$app->user->identity->email;
            if ($model->payment_method == Order::PAYMENT_METHOD_COD) {
                $model->payment_status = Order::PAYMENT_STATUS_COD;
            } else {
                $model->payment_status = Order::PAYMENT_STATUS_UNPAID;
            }
            $model->status = $model->payment_status;

            $products = Cart::find()->where(['session_id' => Yii::$app->session->id])->all();
            if (count($products)) {
                foreach($products as $product) {
                    $model->amount += $product->number * $product->price;
                }
            } else {
                $this->redirect('/cart');
            }
            $model->amount += floatval($model->shipment_fee);

            if ($model->save()) {
                // insert order_product and clear cart
                foreach ($products as $product) {
                    $orderProduct = new OrderProduct();
                    $orderProduct->order_id = $model->id;
                    $orderProduct->product_id = $product->product_id;
                    $orderProduct->sku = $product->sku;
                    $orderProduct->name = $product->name;
                    $orderProduct->number = $product->number;
                    $orderProduct->market_price = $product->market_price;
                    $orderProduct->price = $product->price;
                    $orderProduct->thumb = $product->thumb;
                    $orderProduct->is_gift = $product->is_gift;

                    $orderProduct->save();
                }

                Cart::deleteAll(['session_id' => Yii::$app->session->id]);

                if ($model->payment_method == Order::PAYMENT_METHOD_COD) {
                    return $this->redirect(['cart/cod',
                        'id' => $model->id,
                    ]);
                } else {
                    return $this->redirect(['cart/pay',
                        'sn' => $model->sn,
                    ]);

                }
            }

        }

        $products = Cart::find()->where(['session_id' => Yii::$app->session->id])->all();
        if (!count($products)) {
            return $this->redirect('/cart');
        } if (count($addresses)) {
            return $this->render('checkout', [
                'model' => $model,
                'addresses' => $addresses,
                'products' => $products,
            ]);
        } else {
            return $this->redirect(['cart/address']);
        }

    }

    public function actionAddress($id = null)
    {
        if ($id) {
            $model = Address::findOne($id);
            if ($model === null)
                throw new NotFoundHttpException('model does not exist.');
        } else {
            $model = new Address();
        }

        if ($model->load(Yii::$app->request->post())) {
            $model->user_id = Yii::$app->user->id;
            if ($model->save())
                return $this->redirect(['cart/checkout']);
        }

        return $this->render('address', [
            'model' => $model,
        ]);
    }

    public function actionPay($sn)
    {
        Yii::$app->session['step'] = 3;

        $model = Order::find()->where(['sn' => $sn])->one();
        if ($model === null)
            throw new NotFoundHttpException('model does not exist.');

        return $this->render('pay', [
            'model' => $model,
        ]);
    }

    public function actionCod($id)
    {
        Yii::$app->session['step'] = 3;

        $model = Order::find()->where(['id' => $id])->one();
        if ($model === null)
            throw new NotFoundHttpException('model does not exist.');

        return $this->render('cod', [
            'model' => $model,
        ]);
    }

    public function actionAddToCart($id)
    {
        Yii::$app->session['step'] = 1;

        if (!$id)
            $this->redirect(['/cart']);

        return $this->render('add-to-cart', [
            'id' => $id,
        ]);
    }

    public function actionDelete($id)
    {
        Cart::deleteAll(['session_id' => Yii::$app->session->id, 'product_id' => $id]);
        $this->redirect(['/cart']);
    }

    public function actionDestroy()
    {
        Cart::deleteAll(['session_id' => Yii::$app->session->id]);
        $this->goHome();
    }

    public function actionJsonList()
    {
        $totalNumber = 0;
        $totalPrice = 0;
        $products = Cart::find()->where(['session_id' => Yii::$app->session->id])->asArray()->all();
        foreach ($products as $product) {
            $totalNumber += $product['number'];
            $totalPrice += $product['number'] * $product['price'];
        }

        Yii::$app->response->format = Response::FORMAT_JSON;
        return [
            'status' => 1,
            'totalNumber' => $totalNumber,
            'totalPrice' => $totalPrice,
            'data' => $products,
        ];
    }

    public function actionJsonCoupon()
    {
        $coupons = Coupon::find()->where(['user_id' => Yii::$app->user->id])->asArray()->all();
        foreach ($coupons as $k => $item) {
            $coupons[$k]['ended_time'] = date('Y-m-d', $item['ended_at']);
        }

        Yii::$app->response->format = Response::FORMAT_JSON;
        return [
            'status' => 1,
            'count' => count($coupons),
            'data' => $coupons,
        ];
    }

    public function actionAjaxCouponCode($sn)
    {
        $sn = trim($sn);
        Yii::$app->response->format = Response::FORMAT_JSON;

        if (!$sn) {
            return ['status' => -1];
        }

        $coupon = Coupon::find()->where(['sn' => $sn])->one();
        if ($coupon->used_at > 0) {
            return ['status' => -2];
        } elseif ($coupon->ended_at < time()) {
            return ['status' => -3];
        }

        return [
            'status' => 1,
            'sn' => $coupon->sn,
            'money' => $coupon->money,
        ];
    }

    public function actionAjaxAdd()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $productId = Yii::$app->request->post('productId');
        $number = Yii::$app->request->post('number');
        if ($productId && $number) {
            if ($cart = Cart::find()->where(['and', 'product_id=' . $productId, ['or', 'session_id="' . Yii::$app->session->id . '"', 'user_id=' . Yii::$app->user->isGuest ? 0 : Yii::$app->user->id]])->one()) {
                $cart->updateAllCounters(['number' => $number], ['and', 'product_id=' . $productId, ['or', 'session_id="' . Yii::$app->session->id . '"', 'user_id=' . Yii::$app->user->isGuest ? 0 : Yii::$app->user->id]]);
                return [
                    'status' => 1,
                    'productId' => $productId,
                    'number' => $number,
                ];
            } elseif ($model = Product::findOne($productId)) {
                if ($model->stock > $number) {
                    $cart = new Cart();
                    $cart->session_id = Yii::$app->session->id;
                    $cart->user_id = Yii::$app->user->isGuest ? 0 : Yii::$app->user->id;
                    $cart->product_id = $productId;
                    $cart->number = $number;
                    $cart->sku = $model->sku;
                    $cart->name = $model->name;
                    $cart->market_price = $model->market_price;
                    $cart->price = $model->price;
                    $cart->thumb = $model->thumb;
                    $cart->is_gift = $model->is_gift;

                    $cart->save();

                    return [
                        'status' => 1,
                        'productId' => $productId,
                        'number' => $number,
                    ];
                } else {
                    return [
                        'status' => -2,
                        'productId' => $productId,
                        'number' => $number,
                    ];
                }
            }
        }

        return [
            'status' => -1,
            'productId' => $productId,
            'number' => $number,
        ];

    }

}
