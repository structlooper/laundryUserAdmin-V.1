<?php

namespace App\Http\Controllers;

use App\Membership;
use App\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class MembershipController extends Controller
{
    //
    public function index($id){
        $members =  DB::table('memberships as m')
            ->select('m.id','m.banner_image','m.service_id','m.title','m.price','m.discount','m.desc_1','m.desc_2','m.desc_3','d.duration_name')
            ->join('membership_duration as d','d.id','=','m.duration')
            ->where('m.id',$id)
            ->first();
        $members->service_id = explode(',',$members->service_id);
        $service_names = [];
        foreach ($members->service_id as $service){
            $service_names[] = Service::where('id',$service)->value('service_name');
        }
        $members->service_id = $service_names;
      return (array)$members;
    }
    public function save(Request $request){
        $user_id = $request->user_id;
        $membership_id = $request->membership_id;
        if (DB::table('customers')->where('id',$user_id)->update(['membership' => $membership_id , 'updated_at' => date('Y-m-d H:i:s')])){
            return ['status' => 1 , 'message' => 'Membership added successfully'];
        }return ['status' => 0 , 'message' => 'some internal error contact admin'];
    }
    public function all(){
        return Membership::where('status',1)->select('banner_image','id')->get();
    }
}
