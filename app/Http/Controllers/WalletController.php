<?php

namespace App\Http\Controllers;

use App\Customer;
use App\CustomerPassbook;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WalletController extends Controller
{
    //
    public function statement(Request $request): array
    {
        if($customer = Customer::where('id',$request->customer_id)->first()){
            $data['wallet'] = $customer->wallet;
            $data['statements'] = array_reverse(CustomerPassbook::where('customer_id',$request->customer_id)->get()->toArray());
            return ['status' => 1, 'message' => 'wallet details' , 'result' => $data];
        }else{
            return ['status' => 0, 'message' => 'not a valid customer'];
        }
    }

    public function add_money(Request $request): array
    {
        $amount = $request->amount;
        $customer_id = $request->customer_id;
        if ($amount && $customer_id){
            $last_amount = Customer::where('id',$customer_id)->value('wallet');
            $fina_amount = (float)$last_amount + (float)$amount;
            $u=DB::table('customers')->where('id',$customer_id)->update(['wallet' =>  $fina_amount]);
            if ($u){
                $data['statement'] = 'Rs '.$amount. ' added in wallet via razorpay,  Net amount: Rs '. $fina_amount;
                $data['customer_id'] = $customer_id;
                $data['amount'] = $amount;
                $data['amt_status'] = 'credited';
                CustomerPassbook::insert($data);
                return ['status' => 1 , 'message' => 'wallet recharge successful'];
            }
        }
        return ['status' => 0 , 'message' => 'provide all fields correctly'];
    }
    public function remove_money(Request $request): array
    {
        $amount = $request->amount;
        $customer_id = $request->customer_id;
        if ($amount && $customer_id){
            $last_amount = Customer::where('id',$customer_id)->value('wallet');
            if ((float)$last_amount < (float)$amount){return ['status'=>0,'message' => 'Sorry! wallet balance is low'];}
            $fina_amount = (float)$last_amount - (float)$amount;
            $u=DB::table('customers')->where('id',$customer_id)->update(['wallet' =>  $fina_amount]);
            if ($u){
                $data['statement'] = 'Rs '.$amount.' debited from your wallet for '.($request->for ?? 'Order').',  Net amount: Rs '. $fina_amount;
                $data['customer_id'] = $customer_id;
                $data['amount'] = $amount;
                $data['amt_status'] = 'debited';
                CustomerPassbook::insert($data);
                return ['status' => 1 , 'message' => 'wallet amount debited successful'];
            }
        }
        return ['status' => 0 , 'message' => 'provide all fields correctly'];
    }
}
