<?php

namespace App\Http\Controllers;

use App\Customer;
use App\DeliveryBoy;
use App\Helper\NotiHelper;
use App\Order;
use Illuminate\Http\Request;
use App\PaymentMethod;
use App\PaymentResponse;
use App\AppSetting;
use Cartalyst\Stripe\Stripe;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class PaymentMethodController extends Controller
{
    public function payment(Request $request)
    {
        $input = $request->all();
        if($input['lang'] == 'en'){
            $data = PaymentMethod::where('status',1)->select('id','payment_mode','icon','status')->get();
        }else{
            $data = PaymentMethod::where('status',1)->select('id','payment_mode_ar as payment_mode','icon','status')->get();
        }

        return response()->json([
            "result" => $data,
            "count" => count($data),
            "message" => 'Success',
            "status" => 1
        ]);
    }

    public function stripe_payment(Request $request){
        $input = $request->all();
        $stripe = new Stripe();
        $currency_code = AppSetting::value('currency_short_code');

        try {
            $charge = $stripe->charges()->create([
                'source' => $input['token'],
                'currency' => $currency_code,
                'amount'   => $input['amount'],
                'description' => 'For laundry service booking'
            ]);

            $data['order_id'] = 0;
            $data['customer_id'] = $input['customer_id'];
            $data['payment_mode'] = 2;
            $data['payment_response'] = $charge['id'];

            if(PaymentResponse::create($data)){
                return response()->json([
                    "result" => $charge['id'],
                    "message" => 'Success',
                    "status" => 1
                ]);
            }else{
                return response()->json([
                    "message" => 'Sorry something went wrong',
                    "status" => 0
                ]);
            }


        }
        catch (customException $e) {
            return response()->json([
                "message" => 'Sorry something went wrong',
                "status" => 0
            ]);
        }
    }

    public function status(Request $request){
        $inputs = $request->all();
        $validator = Validator::make($inputs, [
            'order_id' => 'required|numeric',
            'payment_status' => 'required|numeric|in:3,4',
        ]);
        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first()];
        }
        $orderDetails = Order::where('id',$inputs['order_id'])->first();
        if ($orderDetails) {

            switch ($inputs['payment_status']) {
                case ('4'):
                    $user_token = Customer::where('id',$orderDetails->customer_id)->value('fcm_token');
                    $message = DB::table('fcm_notification_messages')->where('id',8)->first();
                    $past_user_noti = DB::table('user_notifications')->where('order_id',$orderDetails->order_id)
                        ->where('fcm_msg_id',$message->id)->where('user_id',$orderDetails->customer_id)->get();
                    if (sizeof($past_user_noti) > 0){
                        DB::table('user_notifications')->where('order_id',$orderDetails->order_id)
                            ->where('fcm_msg_id',$message->id)->where('user_id',$orderDetails->customer_id)->delete();
                    }
                    $noti_details = ['order_id' => $orderDetails->order_id,
                        'fcm_msg_id' => $message->id,
                        'user_id' =>$orderDetails->customer_id,'created_at' => date('y-m-d H:i:s') ];
                    if(DB::table('user_notifications')->insert($noti_details)){
                        NotiHelper::notiSingleUSer($user_token,$message->customer_title,$message->customer_description);
                    }
                    break;
                case ('3'):
                    if (Order::where('id',$inputs['order_id'])->update(['payment_mode' => $inputs['payment_methods']])){
                        $driver_token = DeliveryBoy::where('id',$orderDetails->delivered_by)->value('fcm_token');
                        $message = DB::table('fcm_notification_messages')->where('id',9)->first();
                        $past_driver_noti = DB::table('driver_notifications')->where('order_id',$orderDetails->order_id)
                            ->where('fcm_msg_id',$message->id)->where('driver_id',$orderDetails->delivered_by)->get();
                        if (sizeof($past_driver_noti) > 0){
                            DB::table('driver_notifications')->where('order_id',$orderDetails->order_id)
                                ->where('fcm_msg_id',$message->id)->where('driver_id',$orderDetails->delivered_by)->delete();
                        }
                        $noti_details = ['order_id' => $orderDetails->order_id,
                            'fcm_msg_id' => $message->id,
                            'driver_id' =>$orderDetails->delivered_by,'created_at' => date('y-m-d H:i:s') ];
                        if(DB::table('user_notifications')->insert($noti_details)){
                            NotiHelper::notiSingleUSer($driver_token,$message->delivery_title,$message->delivery_description);
                        }
                    }else{
                        return ['status' => 0 , 'message' => 'Something went wrong try after some times'];
                    }
                    break;
//                case ('5'):
//                    print_r('5');
//                    break;
            }
        if (Order::where('id',$inputs['order_id'])->update(['payment_status' => $inputs['payment_status']])){
            return ['status' => 1, 'message' => 'Order status changed successfully'];
        }return ['status' => 0, 'message' => 'Something went wrong try after some times'];
        }
        return ['status' => 0 , 'message' => 'not a valid order'];
    }
}
