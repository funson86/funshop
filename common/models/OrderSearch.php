<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Order;

/**
 * OrderSearch represents the model behind the search form about `common\models\Order`.
 */
class OrderSearch extends Order
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'country', 'province', 'city', 'district', 'payment_method', 'payment_status', 'payment_id', 'shipment_status', 'shipment_id', 'status', 'paid_at', 'shipped_at', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['sn', 'consignee', 'address', 'zipcode', 'phone', 'mobile', 'email', 'remark', 'payment_name', 'shipment_name', 'invoice'], 'safe'],
            [['payment_fee', 'shipment_fee', 'amount', 'tax'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Order::find();
        
        $query->orderBy(['created_at' => SORT_DESC]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if ($this->load($params) && !$this->validate()) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'country' => $this->country,
            'province' => $this->province,
            'city' => $this->city,
            'district' => $this->district,
            'payment_method' => $this->payment_method,
            'payment_status' => $this->payment_status,
            'payment_id' => $this->payment_id,
            'payment_fee' => $this->payment_fee,
            'shipment_status' => $this->shipment_status,
            'shipment_id' => $this->shipment_id,
            'shipment_fee' => $this->shipment_fee,
            'amount' => $this->amount,
            'tax' => $this->tax,
            'status' => $this->status,
            'paid_at' => $this->paid_at,
            'shipped_at' => $this->shipped_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'sn', $this->sn])
            ->andFilterWhere(['like', 'consignee', $this->consignee])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'zipcode', $this->zipcode])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'mobile', $this->mobile])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'remark', $this->remark])
            ->andFilterWhere(['like', 'payment_name', $this->payment_name])
            ->andFilterWhere(['like', 'shipment_name', $this->shipment_name])
            ->andFilterWhere(['like', 'invoice', $this->invoice]);

        return $dataProvider;
    }
}
