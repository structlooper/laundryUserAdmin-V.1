<?php

namespace App\Admin\Controllers;
use App\Address;
use App\AppSetting;
use App\Customer;
use App\Product;
use App\Http\Controllers\Controller;
use App\ServiceArea;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Illuminate\Support\Facades\DB;
use Encore\Admin\Controllers\ModelForm;

class GeneralController extends Controller
{
    use ModelForm;

    public function GetProducts()
    {
        return Product::where('category_id', $_GET['q'])->get(['id', DB::raw('product_name')]);
    }
    public function GetLeads()
    {
        return Admin::content(function (Content $content) {
            $content->header('Leads');
            $content->description('View');
            $app_setting = AppSetting::first();
            $leads = [];
            $allCustomers = Customer::select('id','customer_name','phone_number','email','default_address')->get();
            $pinCodes = ServiceArea::pluck('pincode')->toArray();
            foreach ($allCustomers as $customer){
                $address = Address::where('id',$customer->default_address)->value('pincode');
                if (!in_array($address,$pinCodes)){
                    $customer->default_address = $address;
                    $leads[] = $customer;
                }
            }
            $data['leads'] = $leads;
            $content->body(view('admin.leads', $data));
        });
    }
}
