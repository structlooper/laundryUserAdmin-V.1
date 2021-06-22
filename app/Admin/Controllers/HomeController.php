<?php

namespace App\Admin\Controllers;

use App\Address;
use App\Customer;
use App\Order;
use App\DeliveryBoy;
use App\PaymentHistory;
use App\ServiceArea;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Facades\Admin;


class HomeController extends Controller
{
    use HasResourceActions;
    public function index(Content $content)
    {
        return Admin::content(function (Content $content) {

            $content->header('Dashboard');
            $data = array();
            $current_year = date("Y");
            $data['customers'] = Customer::where('status','!=',0)->count();
            $data['total_orders'] = Order::count();
            $data['completed_orders'] = Order::where('status','=',7)->count();
            $data['delivery_boys'] = DeliveryBoy::where('status','!=',0)->count();
            $pay = PaymentHistory::all();
            $earnings=0;
            if ($pay){foreach ($pay as $item){$earnings += $item->amount;}}
            $data['earnings'] = $earnings;

            $leads=0;
            $allCustomers = Customer::select('default_address')->get();
            $pinCodes = ServiceArea::pluck('pincode')->toArray();
            foreach ($allCustomers as $customer){
                $address = Address::where('id',$customer->default_address)->value('pincode');
                if (!in_array($address,$pinCodes)){
                    $leads += 1;
                }
            }
            $data['leads'] = $leads;
            $customers = Customer::select('id', 'created_at')
                ->get()
                ->groupBy(function ($val) {
                    return Carbon::parse($val->created_at)->format('M');
                });
            $orders = Order::select('id', 'created_at')
                ->get()
                ->groupBy(function ($val) {
                    return Carbon::parse($val->created_at)->format('M');
                });
            $month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            $temp = [];
            foreach ($customers as $c) {
                $temp[Carbon::parse($c[0]->created_at)->format('M')] = count($c);
            }
            $growth = [];
            foreach ($month as $m) {
                if (isset($temp[$m])) {
                    $growth[] = $temp[$m];
                } else {
                    $growth[] = 0;
                }

            }
            $temp_orders = [];
            foreach ($orders as $o) {
                $temp_orders[Carbon::parse($o[0]->created_at)->format('M')] = count($o);
            }
            $growth_orders = [];
            foreach ($month as $m) {
                if (isset($temp_orders[$m])) {
                    $growth_orders[] = $temp_orders[$m];
                } else {
                    $growth_orders[] = 0;
                }

            }
            $data['customers_chart'] = implode(",", $growth);
            $data['orders_chart'] = implode(",", $growth_orders);

            $content->body(view('admin.dashboard', $data));
        });

    }

}
