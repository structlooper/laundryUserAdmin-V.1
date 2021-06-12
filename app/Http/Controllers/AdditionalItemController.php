<?php

namespace App\Http\Controllers;

use App\AdditionalItem;
use Illuminate\Http\Request;

class AdditionalItemController extends Controller
{
    //
    public function index(){
        return AdditionalItem::get();
    }

}
