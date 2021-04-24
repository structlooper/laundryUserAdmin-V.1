<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
                    return ['status' => 0 , 'message' => 'product not found'];
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
}
