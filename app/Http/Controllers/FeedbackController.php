<?php

namespace App\Http\Controllers;

use App\Feedback;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{
    //
    public function send_query(Request $request): array
    {
        $inputs = $request->all();
        $inputs['created_at'] = date('y-m-d H:i:s');
        if(Feedback::insert($inputs)){
            return ['status' => 1, 'message' => 'Concern send successfully'];
        }return ['status' => 0, 'message' => 'Something went wrong try after some times' ];

    }
}
