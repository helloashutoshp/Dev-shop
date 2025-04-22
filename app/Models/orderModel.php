<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class orderModel extends Model
{
    use HasFactory;
    protected $table = 'order';

    public function orderItems()
    {
     
        return $this->hasMany(oredrItem::class,'order_id');
    }
}
