<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class testController extends Controller
{
    public function index()
    {
        return response()->json([
            'message' => 'This is the testController index method.'
        ]);
    }
}
