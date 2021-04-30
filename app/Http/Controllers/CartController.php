<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CartController extends Controller
{
    //
    public function index($id){
        $cart = DB::table('user_carts')->where('user_id',$id)->where('cart_status','created')->first();
        if (!empty($cart)){
            $cart->cart_products = DB::table('cart_products')->select('cart_products.product_id','products.product_name','products.price','cart_products.unit','cart_products.qty','services.service_name')->join('products','products.id','=','cart_products.product_id')->join('services','services.id','=','products.service_id')->where('cart_id',$cart->id)->get();
        }
        return (array)$cart;
    }
    public function cart(Request $request){
        $product_id = $request->product_id;
        $qty = $request->qty;
        $user_id = $request->user_id;
        $productDetails = DB::table('products')->join('units','units.id','=' , 'products.unit')->where('products.id',$product_id)->first();
        $checkCart = DB::table('user_carts')->where('user_id',$user_id)->where('cart_status','=','created')->first();
        if($checkCart){
            // cart already present
            $checkProduct = DB::table('cart_products')->where('cart_id',$checkCart->id)->where('product_id',$product_id)->first();
            if ($checkProduct) {
                // update product
                if ($qty == 0 or ($checkProduct->qty == 1 and $qty == -1)) {
                    // clear product at 0
                    DB::table('cart_products')->where('cart_id', $checkCart->id)->where('product_id', $product_id)->delete();
                    $subtotal = (float)$checkCart->subtotal - (float)$checkProduct->price;

                    DB::table('user_carts')->update(['subtotal' => $subtotal, 'total_amt' => $subtotal, 'updated_at' => date('Y-m-d ,H:i:s')]);
                    return ['status' => 1, 'message' => 'product removed from cart'];

                } else{
                    if ($qty == -1) {
                        $new_qty = (int)$checkProduct->qty - 1;
                    }else {
                        $new_qty = (int)$checkProduct->qty + 1;
                    }
                    DB::table('cart_products')->where('cart_id', $checkCart->id)->where('product_id', $product_id)->update(['qty' => $new_qty, 'price' => (float)$productDetails->price * $new_qty]);
                    $allProducts = DB::table('cart_products')->where('cart_id', $checkCart->id)->get();
                    $subtotal = 0.0;
                    foreach ($allProducts as $allProduct) {
                        $subtotal += (float)$allProduct->price;
                    }
                    DB::table('user_carts')->update(['subtotal' => $subtotal, 'total_amt' => $subtotal, 'updated_at' => date('Y-m-d ,H:i:s')]);
                    return ['status' => 1, 'message' => 'count changed'];
            }
            }else{
                // insert product
                if ($qty == 0 or $qty < 0){
                    return ['status' => 0 , 'message' => 'product not present in cart'];
                }
                $data =['cart_id'=>$checkCart->id,'product_id' => $product_id , 'qty' => $qty,'price' => (float)$productDetails->price * $qty,'unit' => $productDetails->unit_code];
                $this->insert_products($data);
                return ['status' => 1 , 'message' => 'product added in cart'];
            }
        }else{
            //new cart
            $subtotal = (float)$productDetails->price * (int)$qty;
            $cart_id = DB::table('user_carts')->insertGetId(['user_id' => $user_id, 'cart_status' => 'created','subtotal' => $subtotal,'total_amt' => $subtotal,'created_at' => date('Y-m-d H:i:s')]);
            $data =['cart_id'=>$cart_id,'product_id' => $product_id , 'qty' => $qty,'price' => $subtotal,'unit' => $productDetails->unit_code];
            $this->insert_products($data);
            return ['status' => 1 , 'message' => 'product added in cart'];
        }
    }
    public function insert_products($data)
    {
        DB::table('cart_products')->insert($data);
        $allProducts = DB::table('cart_products')->where('cart_id',$data['cart_id'])->get();
        $subtotal = 0.0;
        foreach ($allProducts as $allProduct){
            $subtotal += (float)$allProduct->price;
        }
        DB::table('user_carts')->update(['subtotal' => $subtotal,'total_amt' => $subtotal,'updated_at' => date('Y-m-d ,H:i:s')]);
        return true;
    }
    public function checkout(Request $request){
        $inputs = $request->all();
        $cart = DB::table('user_carts')->where('id',$inputs['cart_id'])->where('cart_status','created')
            ->where('user_id',$inputs['user_id'])->first();
        if (empty($cart)){return ['status'=>0,'message' => 'cart not found'];}
        $cart_products = DB::table('cart_products')->where('cart_id',$inputs['cart_id'])->get();
        $user_details=DB::table('customers')->where('id',$inputs['user_id'])->first();
        $order = [
            'order_id' => 'ORD'.mt_rand(10000000, 99999999),
            'customer_id' => $inputs['user_id'],
            'address_id'=>$user_details->default_address,
            'expected_pickup_date'=>$cart->pickup_date,
            'expected_delivery_date'=>$cart->drop_date,
            'pickup_time'=>$cart->pickup_time,
            'drop_time'=>$cart->drop_time,
            'total' =>$cart->total_amt,
            'sub_total' =>$cart->subtotal,
            'discount' =>$cart->discount,
            'payment_mode'=>2,
            'items'=>count($cart_products),
            'created_at'=>date('Y-m-d H:i:s'),
            'updated_at'=>date('Y-m-d H:i:s'),
        ];
        $order_get_id = DB::table('orders')->insertGetId($order);
//        $order_get_id =2;
        if ($order_get_id){
            foreach ($cart_products as $cart_product){
                $product_details = DB::table('products')->where('id',$cart_product->product_id)->first();
                $order_products = [
                    'order_id'=>$order_get_id,
                    'product_id'=>$cart_product->product_id,
                    'service_id'=>$product_details->service_id,
                    'qty'=>$cart_product->qty,
                    'price'=>$cart_product->price,
                    'created_at'=>date('Y-m-d H:i:s'),
                    'updated_at'=>date('Y-m-d H:i:s'),
                ];
                DB::table('order_items')->insert($order_products);
            }
            DB::table('user_carts')->where('id',$inputs['cart_id'])->where('cart_status','created')
                ->where('user_id',$inputs['user_id'])->update(['cart_status'=>'ordered']);
            return ['status' => 1,'message' => 'order placed!','data'=>['order_id' => $order_get_id]];
        }
        return ['status' => 0,'message' => 'Order not placed internal error'];

    }
}