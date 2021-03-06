<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Membership extends Model
{
    //
    public function getServiceIdAttribute($value)
    {
        return explode(',', $value);
    }

    public function setServiceIdAttribute($value)
    {
        $this->attributes['service_id'] = implode(',', $value);
    }
}
