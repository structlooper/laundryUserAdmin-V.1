<?php

namespace App\Http\Controllers;

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
            'created_at' => date('Y-m-d H:i:s')
        ];
        if(DB::table('addresses')->insert($data)){
            return ['status' => 1 , 'message' => 'Address saved successfully'];
        }
        return ['status' => 0,'message' => 'Address not saved'];

    }
    public function update_address(Request $request){
        $input = $request->all();

        $data = [
            'address' => $input['address'],
            'door_no' => $input['door_no'],
            'latitude' => $input['lat'],
            'longitude' => $input['lng'],
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
}
