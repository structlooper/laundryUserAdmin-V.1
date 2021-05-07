<?php

namespace App\Http\Controllers;

use App\Helper\NotiHelper;
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
        if ($request->hasFile('profile_image')){
            $image = $request->file('profile_image');
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
        ->select('orders.id','orders.order_id','orders.expected_pickup_date','orders.expected_delivery_date','orders.pickup_time'
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
            ->select('orders.id','orders.order_id','orders.expected_pickup_date','orders.expected_delivery_date','orders.pickup_time'
            ,'orders.drop_time','orders.total','orders.status','addresses.door_no','labels.label_for_delivery_boy','labels.label_image'
            )
            ->join('addresses','addresses.id','=','orders.address_id')
            ->join('labels','labels.id','=','orders.status')
            ->where('orders.delivered_by',$driver_id)
            ->where('orders.status',7)->get()->toArray();
        return array_reverse($orders);
        }
    public function details(Request $req){
        $driver_id = $req->driver_id;
        $orders =  DB::table('orders')
            ->select('orders.id','orders.customer_id','orders.address_id','orders.order_id','orders.expected_pickup_date','orders.expected_delivery_date','orders.pickup_time'
            ,'orders.drop_time','orders.discount','orders.sub_total','orders.total','orders.status','labels.label_for_delivery_boy','labels.label_image'
            )

            ->join('labels','labels.id','=','orders.status')
            ->where('orders.delivered_by',$driver_id)
            ->where('orders.id',$req->order_id)
            ->first();
        if (is_object($orders)) {
            $orders->customer_id = DB::table('customers')
                ->select('customer_name', 'phone_number')
                ->where('id', $orders->customer_id)->first();
            $orders->address_id = DB::table('addresses')
                ->select('address', 'door_no', 'latitude', 'longitude')
                ->where('id', $orders->address_id)->first();
            $orders->products = DB::table('order_items')
                ->select('products.product_name','services.service_name','order_items.qty','order_items.price')
                ->join('products','products.id','=','order_items.product_id')
                ->join('services','services.id','=','order_items.service_id')
                ->where('order_items.order_id',$orders->id)
                ->get();
        }
        return (array)$orders;
    }

}
