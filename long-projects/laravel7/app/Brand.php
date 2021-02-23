<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $fillable = [
        'user_id', 'brand_name', 'brand_image',
    ];
    public function user() {
    	return $this->hasOne(User::class, 'id', 'user_id');
    }
}
