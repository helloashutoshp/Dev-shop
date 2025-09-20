@extends('front.layout.layout')

@section('title', 'Payment Cancelled')

@section('content')
<section class="py-5 text-center">
    <div class="container">
        <h1 class="text-danger">⚠️ Payment Cancelled</h1>
        <p>Your payment for order #{{ $orderModel->id }} was cancelled. You can try again.</p>
        <a href="{{ route('checkout') }}" class="btn btn-warning mt-3">Return to Checkout</a>
    </div>
</section>
@endsection
