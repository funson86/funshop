<?php
namespace common\components;

use common\models\Cart;
use Yii;

/**
 * User
 *
 * @author Funson86 <funson86@gmail.com>
 * @since 2.0
 */
class User extends \funson86\auth\User
{
    public $oldSessionId;

    /**
     * This method is called before logging in a user.
     * The default implementation will trigger the [[EVENT_BEFORE_LOGIN]] event.
     * If you override this method, make sure you call the parent implementation
     * so that the event is triggered.
     * @param IdentityInterface $identity the user identity information
     * @param boolean $cookieBased whether the login is cookie-based
     * @param integer $duration number of seconds that the user can remain in logged-in status.
     * If 0, it means login till the user closes the browser or the session is manually destroyed.
     * @return boolean whether the user should continue to be logged in
     */
    protected function beforeLogin($identity, $cookieBased, $duration)
    {
        $this->oldSessionId = Yii::$app->session->id;
        return parent::beforeLogin($identity, $cookieBased, $duration);
    }


    /**
     * This method is called after the user is successfully logged in.
     * The default implementation will trigger the [[EVENT_AFTER_LOGIN]] event.
     * If you override this method, make sure you call the parent implementation
     * so that the event is triggered.
     * @param IdentityInterface $identity the user identity information
     * @param boolean $cookieBased whether the login is cookie-based
     * @param integer $duration number of seconds that the user can remain in logged-in status.
     * If 0, it means login till the user closes the browser or the session is manually destroyed.
     */
    protected function afterLogin($identity, $cookieBased, $duration)
    {
        $carts = Cart::find()->where(['session_id' => $this->oldSessionId])->all();
        foreach ($carts as $cart) {
            $exist = Cart::find()->where(['user_id' => $identity->id, 'product_id' => $cart->product_id])->one();
            if ($exist) {
                Cart::updateAllCounters(['number' => $cart->number], ['user_id' => $identity->id]);
                Cart::deleteAll(['session_id' => $this->oldSessionId, 'product_id' => $cart->product_id]);
            } else {
                Cart::updateAll(['session_id' => Yii::$app->session->id, 'user_id' => $identity->id], ['session_id' => $this->oldSessionId, 'product_id' => $cart->product_id]);
            }
        }
        Cart::updateAll(['session_id' => Yii::$app->session->id], ['user_id' => $identity->id]);
        //Cart::updateAll(['session_id' => Yii::$app->session->id, 'user_id' => $identity->id], ['session_id' => $this->oldSessionId]);
        return parent::afterLogin($identity, $cookieBased, $duration);
    }

}
