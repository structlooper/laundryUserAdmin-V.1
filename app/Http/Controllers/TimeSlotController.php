<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TimeSlotController extends Controller
{
    //
    public function index($date = null){
        $times = DB::table('time_slots')
            ->select('id','time_from','time_to')->get();
        if ($date === 'today'){
            $final=[];
            foreach ($times as $time){
                if (strtotime($time->time_from) > strtotime(date('h a'))){
                    $final[]=$time;
                }
            }
            $times=$final;
        }
        return $times;
    }
    public function date(): array
    {

        $date['today'] = 'Today '.Carbon::now()->format('d,M');

        $date['next_day'] = 'Tomorrow '.Carbon::now()->addDay()->format('d,M');

        $date['day_after_next'] = Carbon::now()->addDays(2)->format('d,M');
        return $date;

    }
    public function date_drop($id): array
    {
        if ($id == 'drop'){
            $date['today'] = Carbon::now()->addDay()->format('d, M Y').  ' (Tomorrow)';
            $date['day1'] = Carbon::now()->addDay()->format('y-m-d H:i:s');
            $date['next_day'] = Carbon::now()->addDays(2)->format('d, M Y'). ' (Next)';
            $date['day2'] = Carbon::now()->addDays(2)->format('y-m-d');
            $date['day_after_next'] = Carbon::now()->addDays(3)->format('d, M Y');
            $date['day3'] = Carbon::now()->addDays(3)->format('y-m-d');
        }else{
            $date['today'] = Carbon::now()->format('d, M Y').' (Today)';
            $date['day1'] = Carbon::now()->format('Y-m-d H:i:s');
            $date['next_day'] =Carbon::now()->addDay()->format('d, M Y').  ' (Tomorrow)';
            $date['day2'] = Carbon::now()->addDay()->format('y-m-d');
            $date['day_after_next'] = Carbon::now()->addDays(2)->format('d, M Y');
            $date['day3'] = Carbon::now()->addDays(2)->format('y-m-d');
        }
        return $date;
    }
    public function save_date_time(Request $request): array
    {
        $inputs = $request->all();
        if ($inputs['type'] === 'drop'){
            $old_data = DB::table('user_carts')->select('pickup_date','pickup_time')->where('id',$inputs['cart_id'])->first();
            if ($old_data->pickup_date === null or $old_data->pickup_time === null){
                return ['status' => 0,'message' => 'Please select pickup date and time first!'];
            }
            if ($inputs['value'] === 'date'){
                if (strtotime(Carbon::createFromFormat('y-m-d', $old_data->pickup_date)->addDay()->format('y-m-d')) > strtotime($inputs["data"])){
                    return ['status' => 0,'message' => 'Please select at least next day of pickup date'];
                }
                DB::table('user_carts')->where('id',$inputs['cart_id'])->update([$inputs['type'].'_date'=>$inputs['data'],'updated_at' => date('Y-m-d H:i:s')]);
            }else{
                DB::table('user_carts')->where('id',$inputs['cart_id'])->update([$inputs['type'].'_time'=>$inputs['data'],'updated_at' => date('Y-m-d H:i:s')]);
            }

        }else {
            $old_data = DB::table('user_carts')->where('id',$inputs['cart_id'])->first();
            if ($old_data->drop_date !== null or $old_data->drop_time !== null){
                return ['status' => 0,'message' => 'Please clear drop date and time to change pickup time!'];
            }
            if ($inputs['value'] == 'time') {
//                $cart_data = DB::table('user_carts')->where('id',$inputs['cart_id'])->first();
//                $pickup_date = $cart_data->pickup_date;
//                $pickup_time = str_replace(' ',':00 ',explode('to ',$inputs['data'])[1]);
//                $pickup_date_time =$pickup_date.' '.$pickup_time;
//
//                $cart_products = DB::table('cart_products')
//                    ->select('services.service_time')
//                    ->join('products','products.id','=','cart_products.product_id')
//                    ->join('services','services.id','=','products.service_id')
//                    ->where('cart_products.cart_id',$inputs['cart_id'])
//                    ->get();
//                $times = [];
//                foreach ($cart_products as $cart_product){
//                    array_push($times,$cart_product->service_time);
//                }
//                $time_to_add = max($times);
//                print_r(date('Y-m-d H:i',strtotime('+'.$time_to_add.'hour',strtotime($pickup_date_time))));exit;
//                return (array)$cart_data;
                DB::table('user_carts')->where('id', $inputs['cart_id'])->update([$inputs['type'] . '_time' => $inputs['data'], 'updated_at' => date('Y-m-d H:i:s')]);

            } else {
                DB::table('user_carts')->where('id', $inputs['cart_id'])->update([$inputs['type'] . '_date' => $inputs['data'], 'updated_at' => date('Y-m-d H:i:s')]);
            }
        }
        return ['status' => 1 , 'message' => 'Slot updated successfully'];
    }
    public function slots_clear(Request $request): array
    {
        $inputs = $request->all();
        DB::table('user_carts')->where('id', $inputs['cart_id'])->update([$inputs['type'] . '_date' => null,$inputs['type'] . '_time' => null, 'updated_at' => date('Y-m-d H:i:s')]);
        return ["status" => 1,'message' => $inputs['type'].' slots clear'];
    }
}
