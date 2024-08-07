<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "printers".
 *
 * @property int $id
 * @property string $name
 * @property string $station
 */
class Printer extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'printers';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'station'], 'required'],
            [['name'], 'string', 'max' => 255],
            [['station'], 'string', 'max' => 1],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'station' => 'Station',
        ];
    }
}
