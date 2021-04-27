<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TimeSlotController extends Controller
{
    //
    public function index(){
        return DB::table('time_slots')->select('id','time_from','time_to')->get();
    }

}
