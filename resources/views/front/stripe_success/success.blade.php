@extends('front.layout.layout')

@section('title', 'Payment Success')

@section('content')
<section class="py-5 text-center">
    <div class="container">
        <h1 class="text-success">🎉 Payment Successful!</h1>
        <p>Your order #{{ $orderModel->id }} has been successfully placed.</p>
        <a href="{{ route('home') }}" class="btn btn-primary mt-3">Continue Shopping</a>
    </div>
</section>
@endsection
