<?php

namespace app\controllers;

use Yii;
use app\models\Order;
use app\models\Table;
use yii\filters\Cors;
use yii\web\Response;
use app\models\Printer;
use app\models\Product;
use app\models\OrderDetail;
use yii\rest\ActiveController;
use yii\filters\ContentNegotiator;

class OrderController extends ActiveController
{
    public $modelClass = 'app\models\Order';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['create']);
        return $actions;
    }

    public function behaviors()
    {
        $behaviors = parent::behaviors();

        $behaviors['contentNegotiator'] = [
            'class' => \yii\filters\ContentNegotiator::class,
            'formats' => [
                'application/json' => Response::FORMAT_JSON,
            ],
        ];

        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::className(),
            'cors' => [
                'Origin' => ['*'],
                'Access-Control-Request-Method' => ['POST', 'GET'],
                'Access-Control-Request-Headers' => ['*'],
            ],
        ];

        return $behaviors;
    }

    public function actionCreate()
    {
        $params = Yii::$app->request->post();
        
        $order = new Order();
        $order->table_id = $params['table_id'];
        $order->total_price = 0;

        if ($order->save()) {
            $total_price = 0;
            $printers = [];

            foreach ($params['items'] as $item) {
                $product = Product::findOne($item['product_id']);
                $orderDetail = new OrderDetail();
                $orderDetail->order_id = $order->id;
                $orderDetail->product_id = $item['product_id'];
                $orderDetail->quantity = $item['quantity'];
                $orderDetail->price = $product->price;
                $orderDetail->save();

                $total_price += $item['quantity'] * $product->price;

                $printer = Printer::findOne(['category_id' => $product->category_id]);
                if ($printer) {
                    $printers[$printer->station] = $printer->name;
                }
            }

            $order->total_price = $total_price;
            $order->save();

            return [
                'order_id' => $order->id,
                'total_price' => $total_price,
                'printers' => array_unique($printers)
            ];
        }

        return ['error' => 'Failed to create order'];
    }

    public function actionBill($table_id)
    {
        $table = Table::findOne($table_id);
        if (!$table) {
            return ['error' => 'Table not found'];
        }

        $orders = Order::findAll(['table_id' => $table_id]);
        if (!$orders) {
            return ['error' => 'No orders found for this table'];
        }

        $total_price = 0;
        foreach ($orders as $order) {
            $total_price += $order->total_price;
        }

        return [
            
            'table_name' => $table->name,
            'total_price' => $total_price
        ];
    }
}
