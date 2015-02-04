<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\GoodsImage;

/**
 * GoodsImageSearch represents the model behind the search form about `common\models\GoodsImage`.
 */
class GoodsImageSearch extends GoodsImage
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'goods_id'], 'integer'],
            [['url', 'description', 'thumb_url', 'origin_url'], 'safe'],
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
        $query = GoodsImage::find();
        
        $query->orderBy(['created_at' => SORT_DESC]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if ($this->load($params) && !$this->validate()) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'goods_id' => $this->goods_id,
        ]);

        $query->andFilterWhere(['like', 'url', $this->url])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'thumb_url', $this->thumb_url])
            ->andFilterWhere(['like', 'origin_url', $this->origin_url]);

        return $dataProvider;
    }
}
