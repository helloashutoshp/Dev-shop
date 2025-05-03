<?php

use App\Mail\OrderMale;
use App\Models\Cate;
use App\Models\CountryModel;
use App\Models\orderModel;
use App\Models\ProductImg;
use Illuminate\Support\Facades\Mail;
use App\Models\Page;
function getCategory()
{
    $category = Cate::orderby('name', 'ASC')->with('subCategory')->where('status', 1)->where('showHome', 'Yes')->get();
    return $category;
}

function getProductImg($product_id)
{
    $image = ProductImg::where('product_id', $product_id)->first();
    return $image;
}

function orderMail($id)
{
    $order = orderModel::where('id', $id)->with('orderItems')->first();
    $mailData = [
        'subject' => "Thank's for your order",
        'order' => $order
    ];
    Mail::to($order->email)->send(new OrderMale($mailData));
    // dd($order);
}

function getCountryName($id){
    return CountryModel::where('id',$id)->first();
}

function getPage(){
    $page = Page::orderBy('name','ASC')->get();
    return $page;
}
