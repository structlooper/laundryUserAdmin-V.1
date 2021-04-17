<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use Validator;
use Illuminate\Support\Facades\Hash;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
class CustomerController extends Controller
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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'customer_name' => 'required',
            'phone_number' => 'required|numeric|digits_between:9,20|unique:customers,phone_number',
            'email' => 'required|email|regex:/^[a-zA-Z]{1}/|unique:customers,email',
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        $input['status'] = 1;

        $customer = Customer::create($input);
        $token = JWTAuth::fromUser($customer);
        if (is_object($customer)) {
            return response()->json([
                "result" => $customer,
                "token" => $token,
                "message" => 'Registered Successfully',
                "status" => 1
            ]);
        } else {
            return response()->json([
                "message" => 'Sorry, something went wrong !',
                "status" => 0
            ]);
        }

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

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $input['id'] = $id;
        $validator = Validator::make($input, [
            'id' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        $result = Customer::select('id', 'customer_name','phone_number','email','profile_picture','status')->where('id',$id)->first();

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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'customer_name' => 'required',
            'phone_number' => 'required|numeric|unique:customers,id,'.$id,
            'email' => 'required|email|unique:customers,id,'.$id
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
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

        if (Customer::where('id',$id)->update($input)) {
            return response()->json([
                "result" => Customer::select('id', 'customer_name','phone_number','email','profile_picture','status')->where('id',$id)->first(),
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

    public function login(Request $request){

        $input = $request->all();
        $validator = Validator::make($input, [
            'phone_number' => 'required|numeric|digits_between:9,20',
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        $credentials = request(['phone_number']);
        $customer = Customer::where('phone_number',$credentials['phone_number'])->first();

        if (!($customer)) {
            return response()->json([
                "message" => 'Invalid email or password',
                "status" => 0
            ]);
        }
        if($customer->status == 1){
            $token = JWTAuth::fromUser($customer);
            Customer::where('id',$customer->id)->update([ 'fcm_token' => $input['fcm_token']]);
            return response()->json([
                "result" => $customer,
                "token" => $token,
                "message" => 'Success',
                "status" => 1
            ]);
        }else{
            return response()->json([
                "message" => 'Your account has been blocked',
                "status" => 0
            ]);
        }


    }

    public function profile_picture(Request $request){

        $input = $request->all();
        $validator = Validator::make($input, [
            'customer_id' => 'required',
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
            if(Customer::where('id',$input['customer_id'])->update([ 'profile_picture' => 'images/'.$name ])){
                return response()->json([
                    "result" => Customer::select('id', 'customer_name','phone_number','email','profile_picture','status')->where('id',$input['customer_id'])->first(),
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

        $customer = Customer::where('email',$input['email'])->first();
        if(is_object($customer)){
            $otp = rand(1000,9999);
            Customer::where('id',$customer->id)->update(['otp'=> $otp ]);
            $mail_header = array("otp" => $otp);
            $this->send_mail($mail_header,'Reset Password',$input['email']);
            return response()->json([
                "result" => Customer::select('id', 'otp')->where('id',$customer->id)->first(),
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

        if(Customer::where('id',$input['id'])->update($input)){
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

    public function authenticate(Request $request)
    {
        $credentials = $request->only('phone_number');

        try {
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credentials'], 400);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'could_not_create_token'], 500);
        }

        return response()->json(compact('token'));
    }

    public function getAuthenticatedUser()
    {
        try {

            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['user_not_found'], 404);
            }

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {

            return response()->json(['token_expired'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {

            return response()->json(['token_invalid'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

            return response()->json(['token_absent'], $e->getStatusCode());

        }

        return response()->json(compact('user'));
    }

}
