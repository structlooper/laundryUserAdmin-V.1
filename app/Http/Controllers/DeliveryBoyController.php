<?php

namespace App\Http\Controllers;

use App\Address;
use App\AppSetting;
use App\BarCode;
use App\Customer;
use App\Helper\NotiHelper;
use App\Service;
use App\ServiceArea;
use Illuminate\Http\Request;
use App\DeliveryBoy;
use App\Order;
use Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
class DeliveryBoyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }
    public function otp(Request $request){
        $input = $request->all();
        $validator = Validator::make($input, [
            'phone_number' => 'required|numeric|digits_between:10,10',
            'otp' => 'required|numeric'
        ]);

        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first(),'data' => []];
        }
        $driver = DeliveryBoy::where('phone_number',$input['phone_number'])->first();
        if ($driver->otp === $input['otp']){
            if (is_object($driver)) {
                return [
                    "result" => $driver,
                    "message" => 'Otp verified Successfully',
                    "status" => 1
                ];
            } else {
                return [
                    "message" => 'Sorry, something went wrong !',
                    "status" => 0
                ];
            }
        }else{
            return ['status' => 0,'message' => 'Wrong Otp','data' => []];
        }

    }

     public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'delivery_boy_name' => 'required',
            'phone_number' => 'required|numeric|digits_between:9,20|unique:delivery_boys,phone_number',
            'email' => 'required|email|regex:/^[a-zA-Z]{1}/|unique:delivery_boys,email',
            'profile_image' => 'image|mimes:jpeg,png,jpg,gif,svg'
        ]);

        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first(),'data' => []];
        }
        if ($request->hasFile('profile_picture')){
            $image = $request->file('profile_picture');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/images');
            $image->move($destinationPath, $name);
            $input['profile_picture'] = 'images/'.$name;
        }
        $input['status'] = 1;
        $input['otp'] = mt_rand(100000, 999999);
        DeliveryBoy::create($input);
        if(NotiHelper::sendOtpFunction($input['phone_number'],$input['otp'])){
            return ['status'=> 1,'message' => 'Verification otp sent on your phone','data' => []];
        }else{
            return ['status' => 0,'message' => 'Otp not sent','data' => []];
        }

    }

     public function update(Request $request, $id)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'delivery_boy_name' => 'required',
            'phone_number' => 'required|numeric|unique:delivery_boys,id,'.$id,
            'email' => 'required|email|unique:delivery_boys,id,'.$id
        ]);

        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first(),'data' => []];
        }
        if($request->password){
            $options = [
                'cost' => 12,
            ];
            $input['password'] = password_hash($input["password"], PASSWORD_DEFAULT, $options);
            $input['status'] = 1;
        }else{
            unset($input['password']);
        }

        if (DeliveryBoy::where('id',$id)->update($input)) {
            return response()->json([
                "result" => DeliveryBoy::select('id', 'delivery_boy_name','phone_number','email','profile_picture','status')->where('id',$id)->first(),
                "message" => 'Success',
                "status" => 1
            ]);
        } else {
            return response()->json([
                "message" => 'Sorry, something went wrong...',
                "status" => 0
            ]);
        }

    }
    public function login(Request $request){

        $input = $request->all();
        $validator = Validator::make($input, [
            'phone_number' => 'required|numeric|digits_between:9,20',
        ]);

        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first(),'data' => []];
        }

        $credentials = request(['phone_number']);
        $driver = DeliveryBoy::where('phone_number',$credentials['phone_number'])->first();

        if (!($driver)) {
            return response()->json([
                "message" => 'Your number is not registered, please register',
                "status" => 0
            ]);
        }
        $input['otp'] = mt_rand(100000, 999999);
        if($driver->status == 1){
            DeliveryBoy::where('id',$driver->id)->update([ 'fcm_token' => $input['fcm_token'],'otp' =>  $input['otp']]);
            if(NotiHelper::sendOtpFunction($input['phone_number'],$input['otp'])){
                return ['status'=> 1,'message' => 'Verification otp sent on your phone','data' => []];
            }else{
                return ['status' => 0,'message' => 'Otp not sent','data' => []];
            }
        }else{
            return response()->json([
                "message" => 'Your account has been blocked',
                "status" => 0
            ]);
        }


    }

     public function edit($id)
    {
        $input['id'] = $id;
        $validator = Validator::make($input, [
            'id' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        $result = DeliveryBoy::select('id', 'delivery_boy_name','phone_number','email','profile_picture','status')->where('id',$id)->first();

        if (is_object($result)) {
            return response()->json([
                "result" => $result,
                "message" => 'Success',
                "status" => 1
            ]);
        } else {
            return response()->json([
                "message" => 'Sorry, something went wrong...',
                "status" => 0
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }



    public function profile_picture(Request $request){

        $input = $request->all();
        $validator = Validator::make($input, [
            'delivery_boy_id' => 'required',
            'profile_picture' => 'required|image|mimes:jpeg,png,jpg,gif,svg'
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        if ($request->hasFile('profile_picture')) {
            $image = $request->file('profile_picture');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/images');
            $image->move($destinationPath, $name);
            if(DeliveryBoy::where('id',$input['delivery_boy_id'])->update([ 'profile_picture' => 'images/'.$name ])){
                return response()->json([
                    "result" => DeliveryBoy::select('id', 'delivery_boy_name','phone_number','email','profile_picture','status')->where('id',$input['delivery_boy_id'])->first(),
                    "message" => 'Success',
                    "status" => 1
                ]);
            }else{
                return response()->json([
                    "message" => 'Sorry something went wrong...',
                    "status" => 0
                ]);
            }
        }

    }

    public function forgot_password(Request $request){

        $input = $request->all();
        $validator = Validator::make($input, [
            'email' => 'required|email|regex:/^[a-zA-Z]{1}/',
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        $delivery_boy = DeliveryBoy::where('email',$input['email'])->first();
        if(is_object($delivery_boy)){
            $otp = rand(1000,9999);
            DeliveryBoy::where('id',$delivery_boy->id)->update(['otp'=> $otp ]);
            $mail_header = array("otp" => $otp);
            $this->send_mail($mail_header,'Reset Password',$input['email']);
            return response()->json([
                "result" => DeliveryBoy::select('id', 'otp')->where('id',$delivery_boy->id)->first(),
                "message" => 'Success',
                "status" => 1
            ]);
        }else{
            return response()->json([
                "message" => 'Invalid email address',
                "status" => 0
            ]);
        }

    }

    public function reset_password(Request $request){

        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        $options = [
            'cost' => 12,
        ];
        $input['password'] = password_hash($input["password"], PASSWORD_DEFAULT, $options);

        if(DeliveryBoy::where('id',$input['id'])->update($input)){
            return response()->json([
                "message" => 'Success',
                "status" => 1
            ]);
        }else{
            return response()->json([
                "message" => 'Invalid email address',
                "status" => 0
            ]);
        }
    }

    public function sendError($message) {
        $message = $message->all();
        $response['error'] = "validation_error";
        $response['message'] = implode('',$message);
        $response['status'] = "0";
        return response()->json($response, 200);
    }

    public function dashboard(Request $request){

        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        $result['total_bookings'] = Order::where('delivered_by',$input['id'])->count();
        $result['completed_bookings'] = Order::where('delivered_by',$input['id'])->where('status',7)->count();
        $result['today_bookings'] = Order::where('delivered_by',$input['id'])->whereDay('created_at', date('d'))->count();
        $result['pending_bookings'] = Order::where('delivered_by',$input['id'])->where('status','!=',7)->count();


        if($result){
            return response()->json([
                "result" => $result,
                "message" => 'Success',
                "status" => 1
            ]);
        }else{
            return response()->json([
                "message" => 'Something went wrong',
                "status" => 0
            ]);
        }

    }
    public function orders(Request $req){
        $driver_id = $req->driver_id;
    $orders =  DB::table('orders')
        ->select('orders.id','orders.order_id','orders.expected_pickup_date','orders.estimated_cloths','orders.payment_status','orders.payment_mode','orders.expected_delivery_date','orders.pickup_time'
        ,'orders.drop_time','orders.total','orders.status','addresses.door_no','labels.label_for_delivery_boy','labels.label_image'
        )
        ->join('addresses','addresses.id','=','orders.address_id')
        ->join('labels','labels.id','=','orders.status')
        ->where('orders.delivered_by',$driver_id)
        ->where('orders.status','!=',7)->get()->toArray();
    return array_reverse($orders);
    }
     public function completed(Request $req){
            $driver_id = $req->driver_id;
        $orders =  DB::table('orders')
            ->select('orders.id','orders.order_id','orders.expected_pickup_date','orders.estimated_cloths','orders.payment_status','orders.payment_mode','orders.expected_delivery_date','orders.pickup_time'
            ,'orders.drop_time','orders.total','orders.status','addresses.door_no','labels.label_for_delivery_boy','labels.label_image'
            )
            ->join('addresses','addresses.id','=','orders.address_id')
            ->join('labels','labels.id','=','orders.status')
            ->where('orders.delivered_by',$driver_id)
            ->where('orders.status',7)->get()->toArray();
        return array_reverse($orders);
        }
    public function details(Request $req): array
    {
        $driver_id = $req->driver_id;
        $orders =  DB::table('orders')
            ->select('orders.id','orders.customer_id','orders.address_id','orders.estimated_cloths','orders.delivery_changes_discount','orders.delivery_changes','orders.mem_total_discount','orders.payment_status','orders.payment_mode','orders.selected_service_ids as selected_services','orders.additional_item_ids','orders.order_id','orders.expected_pickup_date','orders.expected_delivery_date','orders.pickup_time'
            ,'orders.drop_time','orders.discount','orders.sub_total','orders.total','orders.status','labels.label_for_delivery_boy','labels.label_image'
            )

            ->join('labels','labels.id','=','orders.status')
            ->where('orders.delivered_by',$driver_id)
            ->where('orders.id',$req->order_id)
            ->first();
        if (is_object($orders)) {
            $orders->selected_services = explode(',',$orders->selected_services);
            $selected_services=[];
            foreach ($orders->selected_services as $selected_service){
                $selected_services[]=Service::where('id',$selected_service)->value('service_name');
            }
            $orders->selected_services = implode(', ',$selected_services);
            $orders->customer_id = DB::table('customers')
                ->select('customer_name', 'phone_number')
                ->where('id', $orders->customer_id)->first();
            $orders->address_id = DB::table('addresses')
                ->select('address', 'door_no', 'latitude', 'longitude')
                ->where('id', $orders->address_id)->first();
            $orders->products = DB::table('order_items')
                ->select('products.id as product_id','products.product_name','order_items.item_count','order_items.unit','order_items.item_count','services.service_name','order_items.qty','order_items.price')
                ->join('products','products.id','=','order_items.product_id')
                ->join('services','services.id','=','order_items.service_id')
                ->where('order_items.order_id',$orders->id)
                ->get();
        }
        return (array)$orders;
    }
    public function status(Request $request): array
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'driver_id' => 'required|numeric',
            'order_id' => 'required|numeric',
            'status' => 'required|numeric|in:0,3,4,6,7'
        ]);
        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first()];
        }
        $driver = DB::table('delivery_boys')->where('id',$input['driver_id'])->first();
        if (!is_object($driver)){return ['status' => 0 , 'message' => 'not a valid driver'];}
        $order = DB::table('orders')->where('id',$input['order_id'])->first();
        if (!is_object($order)){return ['status' => 0 , 'message' => 'not a valid orders'];}
        elseif ($order->status === 7){return ['status' => 0 , 'message' => 'Order already delivered'];}

        if ($input['status'] == 0) {
            $order_status = ['status' => 1, 'delivered_by' => null, 'updated_at' => date('Y-m-d H:i:s')];
        }else{
            $order_status = ['status' => $input['status'],'updated_at' => date('Y-m-d H:i:s')];
        }
        if (DB::table('orders')->where('id',$input['order_id'])->update($order_status)){
            $message = DB::table('fcm_notification_messages')->where('id',$input['status'])->first();
            $order_id = $order->order_id;
            $drive_type = DeliveryBoy::where('id',$input['driver_id'])->select('delivery_boy_type','commission')->first();
            if($input['status'] == 7 && $drive_type->delivery_boy_type === 1){
                ///Adding earning
                $check = DB::table('earning_status')->where('order_id',$order->order_id)->first();
                if (is_object($check)){$response = ['status' => 1,'message' => 'earning is already added in wallet'];}else {
                    $earn = (($order->total * $drive_type->commission) / 100);
                    if (DB::table('earning_status')->insert([
                        'driver_id' => $driver->id,
                        'order_id' => $order->order_id,
                        'total_amt' => $order->total,
                        'earn_amt' => $earn,
                        'created_at' => date('Y-m-d H:i:s')
                    ])) {
                        DeliveryBoy::where('id', $input['driver_id'])->update([
                            'wallet' => $driver->wallet + $earn,
                            'updated_at' => date('Y-m-d H:i:s')
                        ]);
                        $response = ['status' => 1, 'message' => 'order delivered successfully'];
                    }
                }
            }else{
                $response = ['status' => 1,'message' => 'order status updated'];
            }

            $customer_token = Customer::where('id',$order->customer_id)->value('fcm_token');
            NotiHelper::notiSingleUSer($customer_token,$message->customer_title.'('.$order_id.')',$message->customer_description);
            $past_user_noti = DB::table('user_notifications')->where('order_id',$order_id)->where('fcm_msg_id',$message->id)->where('user_id' ,$order->customer_id)->get();
            if (sizeof($past_user_noti) > 0){
                DB::table('user_notifications')->where('order_id',$order_id)->where('fcm_msg_id',$message->id)->where('user_id' ,$order->customer_id)->delete();
            }
            $noti_details = ['order_id' => $order_id,'fcm_msg_id' => $message->id,'user_id' =>$order->customer_id,'created_at' => date('y-m-d H:i:s') ];
            DB::table('user_notifications')->insert($noti_details);

            return $response;
        }return ['status' => 0,'message' => 'something went wrong'];
    }
    public function notifications(Request $request){
        $driver_id = $request->driver_id;
        $notifications_db = DB::table('driver_notifications')
            ->select('orders.id','driver_notifications.order_id','f_msg.status_image','f_msg.customer_title as title','f_msg.customer_description as desc','driver_notifications.created_at')
            ->join('fcm_notification_messages as f_msg','f_msg.id','=','driver_notifications.fcm_msg_id')
            ->join('orders','orders.order_id','=','driver_notifications.order_id')
            ->where('driver_id',$driver_id)->get();
        if (sizeof($notifications_db) > 0){
            $notifications= [];
            foreach ($notifications_db as $item){
                $item->created_at = date('H:i',strtotime($item->created_at));
                $notifications[] = $item;
            }
            return ['status' => 1 ,"data" => array_reverse($notifications)];
        }
        return ['status' => 0,'data' => []];
    }
    public function update_profile(Request $request){
        $validator = Validator::make($request->all(), [
            'driver_id' => 'required',
            'delivery_boy_name' => 'required',
            'email' => 'required|email|regex:/^[a-zA-Z]{1}/',
            'profile_image' => 'image|mimes:jpeg,png,jpg,gif,svg'
        ]);
        if ($validator->fails()) {
            return ['status' => 0,'message' => $validator->errors()->first(),'data' => []];
        }
        $driver_id = $request->driver_id;
        $user['delivery_boy_name'] = $request->delivery_boy_name;
        $user['email'] = $request->email;
        if ($request->hasFile('profile_picture')){
            $image = $request->file('profile_picture');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/images');
            $image->move($destinationPath, $name);
            $user['profile_picture'] = 'images/'.$name;
        }
        if (DB::table('delivery_boys')->where('id',$driver_id)->update($user)){
            $new_details = DB::table('delivery_boys')->where('id',$driver_id)->first();
            return ['status'=>1,'message' => 'Profile details updated!',"data" => $new_details];
        }return ['status' => 0,'message' => 'Some internal error',];
    }
    public function refresh_details(Request $request){
        return (array)DB::table('delivery_boys')->where('id',$request->driver_id)->first();
    }
    public function earnings(Request $request){
        return DB::table('earning_status')->where('driver_id',$request->driver_id)->get();
    }
    public function order(Request $request){

        $product_id = $request->product_id;
        $qty = $request->qty;
        $order_id = $request->order_id;
        $order_details = Order::where('id',$order_id)->first();
        $user_details = Customer::where('id',$order_details->customer_id)->first();
        $pin_code = Address::where('id',$user_details->default_address)->value('pincode');
        $delivery_charge = ServiceArea::where('pincode',$pin_code)->value('delivery_changes') ?? 0;
        $membership = DB::table('memberships')->where('id',$user_details->membership)->first();
        $productDetails = DB::table('products')->join('units','units.id','=' , 'products.unit')->where('products.id',$product_id)->first();
        $checkProduct = DB::table('order_items')->where('order_id',$order_id)->where('product_id',$product_id)->first();
        $min_order = AppSetting::where('id',1)->value('minimum_order_amt');
        if ($checkProduct) {

            if (($qty == 0 or ($checkProduct->qty < 2 and $qty == -1)) and $qty != '++1') {
                DB::table('order_items')
                    ->where('order_id', $order_id)
                    ->where('product_id', $product_id)->delete();

                $this->sync_order($delivery_charge,$order_id,$min_order);

                return ['status' => 1, 'message' => 'product removed'];
            }else{
                if ($qty == -1) {
                    $new_qty = (float)$checkProduct->qty - 1;
                } else if ($qty == '++1') {
                    $new_qty = (float)$checkProduct->qty + 1;
                }else{
                    $new_qty = (float)$qty;
                }
                $mem_dis = 0;
                if ($membership){
                    $mem_service_array = explode(',',$membership->service_id);
                    if(in_array($productDetails->service_id,$mem_service_array)) {
                        $service_index = array_search($productDetails->service_id, $mem_service_array);
                        $mem_dis_percent_array =   explode(',',$membership->discount);
                        $dis_per =  $mem_dis_percent_array[$service_index] ?? 0;
                        $mem_dis = ((float)$productDetails->price *$dis_per) / 100;
                    }
                }
                $cal_price = (float)$productDetails->price - $mem_dis;
                DB::table('order_items')
                    ->where('order_id', $order_id)
                    ->where('product_id', $product_id)
                    ->update(['qty' => $new_qty,
                        'u_price' => (float)$productDetails->price * $new_qty,
                        'price' => $cal_price * $new_qty ,
                        'mem_dis' => $mem_dis * $new_qty
                    ]);

                $this->sync_order($delivery_charge,$order_id,$min_order);

                return ['status' => 1, 'message' => 'count updated'];
            }
        }else{
            // insert product
            if (($qty == 0 or $qty < 0) and $qty != '++1'){
                return ['status' => 0 , 'message' => 'product not present'];
            }else if ($qty == '++1'){
                $qty = 1;
            }
            $mem_dis = 0;
//            if ($membership){
//                $mem_service_array = explode(',',$membership->service_id);
//                if(in_array($productDetails->service_id,$mem_service_array)) {
//                    $mem_dis = ((float)$productDetails->price * $membership->discount) / 100;
//                }
//            }
            if ($membership){
                $mem_service_array = explode(',',$membership->service_id);
                if(in_array($productDetails->service_id,$mem_service_array)) {
                    $service_index = array_search($productDetails->service_id, $mem_service_array);
                    $mem_dis_percent_array =   explode(',',$membership->discount);
                    $dis_per =  $mem_dis_percent_array[$service_index] ?? 0;
                    $mem_dis = ((float)$productDetails->price *$dis_per) / 100;
                }
            }
            $cal_price = (float)$productDetails->price - $mem_dis;
            $data =[
                'order_id'=>$order_id,
                'product_id' => $product_id ,
                'mem_dis' => $mem_dis * $qty,
                'qty' => $qty,
                'u_price' => (float)$productDetails->price * $qty,
                'service_id' => $productDetails->service_id,
                'price' => $cal_price * $qty,
                'unit'=>$productDetails->unit_code,
                'updated_at' => date('y-m-d H:i:s'),
                'created_at' => date('y-m-d H:i:s'),
            ];
            DB::table('order_items')->insert($data);

            $this->sync_order($delivery_charge,$order_id,$min_order);

            return ['status' => 1 , 'message' => 'product added'];
        }
    }
    function sync_order($delivery_charge,$order_id,$min_order){
        $subtotal = 0.0;
        $total = $delivery_charge;
        $delivery_charge_discount = 0.00;
        $mem_total_discount = 0.00;
        $allProducts = DB::table('order_items')->where('order_id', $order_id)->get();
        foreach ($allProducts as $allProduct) {
            $subtotal += (float)$allProduct->u_price;
            $total += (float)$allProduct->price;
            $mem_total_discount += (float)$allProduct->mem_dis;
        }
        if ($subtotal > $min_order){
            $total = $total-$delivery_charge;
            $delivery_charge_discount = $delivery_charge;
        }
        DB::table('orders')->where('id',$order_id)->update([
            'sub_total' => $subtotal,
            'total' => $total,
            'delivery_changes' => $delivery_charge,
            'delivery_changes_discount' => $delivery_charge_discount,
            'mem_total_discount' => $mem_total_discount,
            'updated_at' => date('Y-m-d H:i:s')]);

    }

    public function update_count(Request $request): array
    {
        $order_id = $request->order_id;
        $product_id = $request->product_id;
        $count = $request->item_count;
        if (DB::table('order_items')->where('order_id',$order_id)
            ->where('product_id',$product_id)->update(['item_count'=>$count])){
            return ['status' => 1, 'message' => 'saved'];
        }return ['status' => 0, 'message' => 'not saved'];
    }
    public function barCode(Request $request): array
    {
        $driver_id = $request->driver_id;
        $barcodes = DeliveryBoy::where('id',$driver_id)->value('bar_codes');
        $barcodes_result = [];
        if (sizeof($barcodes) > 0){
            foreach ($barcodes as $barcode){
                $barcodes_result[] = BarCode::where('id',$barcode)->select('id','title','description','barcode_image')->first();
            }
        }
        return $barcodes_result;
    }

    public function cancel(Request $request): array
    {
        $input = $request->all();

        if (Order::where('id',$input['order_id'])->update(['status' => $input['status'] , 'cance_reason' => $input['cance_reason']])){
            return ['status' => 1,'message' => 'order cancelled'];
        }return ['status' => 0 , 'message' => 'something went wrong' ];
    }
}
