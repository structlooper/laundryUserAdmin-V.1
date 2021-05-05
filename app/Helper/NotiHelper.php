<?php


namespace App\Helper;

use DB;
class NotiHelper
{
    public static function notiSingleUSer($to,$title,$body){
        $app_setting = DB::table('app_settings')->select('fcm_server_key')->first();
        $url = 'https://fcm.googleapis.com/fcm/send';
        $notification = array('title' =>$title, 'body' => $body);
        $arrayToSend = array('registration_ids' => array($to), 'notification' => $notification, 'priority'=>'high');
        $tempArr = $arrayToSend;
        $fields = json_encode($arrayToSend);
        $headers = array (
            'Authorization: key=' . $app_setting->fcm_server_key,
            'Content-Type: application/json'
        );
        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_URL, $url );
        curl_setopt ( $ch, CURLOPT_POST, true );
        curl_setopt ( $ch, CURLOPT_HTTPHEADER, $headers );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
        curl_setopt ( $ch, CURLOPT_POSTFIELDS, $fields );
        $result = curl_exec ( $ch );
        // var_dump($result);
        curl_close ( $ch );
        return $result;

    }
}
