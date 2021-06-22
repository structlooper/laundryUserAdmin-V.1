<?php

namespace App\Http\Controllers;

use App\Address;
use App\Customer;
use App\ServiceArea;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
class UserAddressController extends Controller
{
    //
    public function add_address(Request $request){
        $input = $request->all();

        $validator =  Validator::make($input,[
            'user_id' => 'required',
            'door_no' => 'required',
            'address' => 'required',
            'lat' => 'required',
            'lng' => 'required',
            'pincode' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first()];
        }
        $data = [
            'customer_id' => $input['user_id'],
            'address' => $input['address'],
            'door_no' => $input['door_no'],
            'latitude' => $input['lat'],
            'longitude' => $input['lng'],
            'pincode' => $input['pincode'],
            'created_at' => date('Y-m-d H:i:s')
        ];
        $address_id=DB::table('addresses')->insertGetId($data);
        if($address_id !== 0){
            return ['status' => 1 , 'message' => 'Address saved successfully' , 'address_id' => $address_id];
        }
        return ['status' => 0,'message' => 'Address not saved'];

    }
    public function update_address(Request $request){
        $input = $request->all();
        $validator =  Validator::make($input,[
            'user_id' => 'required',
            'door_no' => 'required',
            'address' => 'required',
            'lat' => 'required',
            'lng' => 'required',
            'pincode' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first()];
        }
        $data = [
            'address' => $input['address'],
            'door_no' => $input['door_no'],
            'latitude' => $input['lat'],
            'longitude' => $input['lng'],
            'pincode' => $input['pincode'],
            'updated_at' => date('Y-m-d H:i:s')
        ];
        if(DB::table('addresses')
            ->where('id',$input['address_id'])
            ->where('customer_id',$input['user_id'])
            ->update($data)){
            return ['status' => 1 , 'message' => 'Address updated successfully'];
        }
        return ['status' => 0,'message' => 'Address not updated'];
    }
    public function get_address_id($id) {
        return (array)DB::table('addresses')->where('id',$id)->first();
    }
    public function delete(Request $request){
        $input = $request->all();
        $validator =  Validator::make($input,[
            'user_id' => 'required',
           'address_id' => 'required'
        ]);
        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first()];
        }
        if(DB::table('addresses')
            ->where('id',$input['address_id'])
            ->where('customer_id',$input['user_id'])
            ->delete()){
            return ['status' => 1 , 'message' => 'Address deleted successfully'];
        }
        return ['status' => 0,'message' => 'Address not deleted'];
    }
    public function select_address(Request $request){
        $inputs = $request->all();
        $selected_pin_code = Address::where('id',$inputs['address_id'])->value('pincode');
        $service_pin_codes = ServiceArea::select('delivery_changes','pincode')->get()->toArray();
        $delivery_charges = 0;
        foreach ($service_pin_codes as $key => $service_pin_code){
            if ((string)$selected_pin_code === $service_pin_code['pincode']){
                $delivery_charges = (float)$service_pin_code['delivery_changes'];
            }
        }
        $dateTimeIn = date('Y-m-d H:i:s');
        $subtotal = (DB::table('user_carts')
            ->select('subtotal')
            ->where('user_id',$inputs['user_id'])
            ->where('cart_status','created')
            ->first())->subtotal;
        if(DB::table('customers')
            ->where('id',$inputs['user_id'])
            ->update([
                'default_address' => $inputs['address_id'],
                'updated_at' => $dateTimeIn
            ]) && DB::table('user_carts')
                ->where('user_id',$inputs['user_id'])
                ->where('cart_status','created')
                ->update([
                    'delivery_changes' => $delivery_charges,
                    'total_amt' => (float)$subtotal + $delivery_charges,
                    'updated_at' => $dateTimeIn
                ])){
            return ['status' => 1 , "message" => 'default address saved'];
        }return ['status' => 0,'message' => 'address not saved'];

    }
    public function checkAddress($user_id): array
    {
        $default_address = Customer::where('id',$user_id)->value('default_address');
        $address_pin = Address::where('id',$default_address)->value('pincode');
        $getPinCodes = ServiceArea::pluck('pincode')->toArray();
        if (in_array((string)$address_pin,$getPinCodes)){
            return ['status' => 1,'message' => 'Matched'];
        }
        return ['status' => 0,'message' => 'Sorry our service is not available in selected address & pin-code'];
    }
    public function admin_noti(Request $request){
        function sendMessage(){
            $content = array(
                "en" => 'New Order arrived!!'
            );

            $fields = array(
                'app_id' => env('ONESIGNAL_APPID'),
                'included_segments' => array('All'),
                'data' => array("foo" => "bar"),
//                'large_icon' =>"ic_launcher_round.png",
                'contents' => $content,
                'web_buttons' => [array(
                    "id" => "view-order",
                    "text" => "View",
                    "icon" => "https://image.flaticon.com/icons/png/128/4887/4887274.png",
                    "url" => url('/admin/orders')
                )]
            );

            $fields = json_encode($fields);
            print_r("\nJSON sent:\n");
            print_r($fields);

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8',
                'Authorization: Basic '.env('REST_API_KEY')));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($ch, CURLOPT_HEADER, FALSE);
            curl_setopt($ch, CURLOPT_POST, TRUE);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

            $response = curl_exec($ch);
            curl_close($ch);

            return $response;
        }

        $response = sendMessage();
        $return["allresponses"] = $response;
        $return = json_encode( $return);
        print_r("\n\nJSON received:\n");
        print_r($return);
        print_r("\n");
    }
}
