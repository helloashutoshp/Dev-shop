<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\orderModel;
use Illuminate\Http\Request;

class stripeController extends Controller
{
        public function success(Request $request, $order)
    {
        $sessionId = $request->get('session_id'); // Stripe Checkout session ID

        // Update order status
        $orderModel = orderModel::findOrFail($order);
        $orderModel->payment_status = 'paid';
        $orderModel->save();

        return view('front.stripe_success.success', compact('orderModel'));
    }

    // Handle cancel
    public function cancel($order)
    {
        // Optional: Mark order as cancelled or keep unpaid
        $orderModel = orderModel::findOrFail($order);

        return view('front.stripe_success.cancel', compact('orderModel'));
    }
}
