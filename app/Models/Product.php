<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = 'prod';
    public function product_img(){
        return $this->hasMany(ProductImg::class);
    }

    public function rating(){
        return $this->hasMany(Rating::class)->where('status',0)->latest();
    }
}