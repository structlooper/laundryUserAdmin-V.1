<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeliveryBoy extends Model
{
    protected $fillable = [
        'id', 'delivery_boy_name', 'phone_number','email','profile_picture','status','otp','fcm_token','bar_codes'
    ];

    public function getBarCodesAttribute($value)
    {
        return explode(',', $value);
    }

    public function setBarCodesAttribute($value)
    {
        $this->attributes['bar_codes'] = implode(',', $value);
    }
}

