<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stock_basics".
 *
 * @property integer $id
 * @property string $code
 * @property string $name
 * @property string $industry
 * @property string $area
 * @property double $pe
 * @property double $outstanding
 * @property double $totals
 * @property double $totalAssets
 * @property double $liquidAssets
 * @property double $fixedAssets
 * @property double $reserved
 * @property double $reservedPerShare
 * @property double $esp
 * @property double $bvps
 * @property double $pb
 * @property integer $timeToMarket
 */
class StockBasics extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stock_basics';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code'], 'required'],
            [['pe', 'outstanding', 'totals', 'totalAssets', 'liquidAssets', 'fixedAssets', 'reserved', 'reservedPerShare', 'esp', 'bvps', 'pb'], 'number'],
            [['timeToMarket'], 'integer'],
            [['code'], 'string', 'max' => 6],
            [['name', 'industry', 'area'], 'string', 'max' => 63],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'code' => 'Code',
            'name' => 'Name',
            'industry' => 'Industry',
            'area' => 'Area',
            'pe' => 'Pe',
            'outstanding' => 'Outstanding',
            'totals' => 'Totals',
            'totalAssets' => 'Total Assets',
            'liquidAssets' => 'Liquid Assets',
            'fixedAssets' => 'Fixed Assets',
            'reserved' => 'Reserved',
            'reservedPerShare' => 'Reserved Per Share',
            'esp' => 'Esp',
            'bvps' => 'Bvps',
            'pb' => 'Pb',
            'timeToMarket' => 'Time To Market',
        ];
    }
}
