@extends('front.layout.layout')

@section('title')
    Checkout
@endsection

@section('content')
    <section class="section-5 pt-3 pb-3 mb-3 bg-white">
        <div class="container">
            <div class="light-font">
                <ol class="breadcrumb primary-color mb-0">
                    <li class="breadcrumb-item"><a class="white-text" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="white-text" href="#">Shop</a></li>
                    <li class="breadcrumb-item">Checkout</li>
                </ol>
            </div>
        </div>
    </section>

    <section class="section-9 pt-4">
        <div class="container">
            <form action="" id="checkoutForm">
                <div class="row">
                    <!-- Shipping Address -->
                    <div class="col-md-8">
                        <div class="sub-title">
                            <h2>Shipping Address</h2>
                        </div>
                        <div class="card shadow-lg border-0">
                            <div class="card-body checkout-form">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <input type="text" name="first_name" id="first_name" class="form-control"
                                            placeholder="First Name"
                                            value="{{ !empty($address) ? $address->firstName : '' }}">
                                        <p></p>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <input type="text" name="last_name" id="last_name" class="form-control"
                                            placeholder="Last Name"
                                            value="{{ !empty($address) ? $address->lastName : '' }}">
                                        <p></p>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <input type="text" name="email" id="email" class="form-control"
                                            placeholder="Email" value="{{ !empty($address) ? $address->email : '' }}">
                                        <p></p>
                                    </div>
                                    @if ($country->isNotEmpty())
                                        <div class="col-md-12 mb-3">
                                            <select name="country" id="country" class="form-control">
                                                <option value="">Select a Country</option>
                                                @foreach ($country as $cnt)
                                                    <option value="{{ $cnt->id }}"
                                                        {{ !empty($address) && $address->country_id == $cnt->id ? 'selected' : '' }}>
                                                        {{ $cnt->name }}</option>
                                                @endforeach
                                            </select>
                                            <p></p>
                                        </div>
                                    @endif
                                    <div class="col-md-12 mb-3">
                                        <textarea name="address" id="address" cols="30" rows="3" placeholder="Address" class="form-control">{{ !empty($address) ? $address->address : '' }}</textarea>
                                        <p></p>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <input type="text" name="appartment" id="appartment" class="form-control"
                                            placeholder="Apartment, suite, unit, etc. (optional)"
                                            value="{{ !empty($address) ? $address->appartment : '' }}">
                                        <p></p>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <input type="text" name="city" id="city" class="form-control"
                                            placeholder="City" value="{{ !empty($address) ? $address->city : '' }}">
                                        <p></p>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <input type="text" name="state" id="state" class="form-control"
                                            placeholder="State" value="{{ !empty($address) ? $address->state : '' }}">
                                        <p></p>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <input type="text" name="zip" id="zip" class="form-control"
                                            placeholder="Zip" value="{{ !empty($address) ? $address->zip : '' }}">
                                        <p></p>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <input type="text" name="mobile" id="mobile" class="form-control"
                                            placeholder="Mobile No."
                                            value="{{ !empty($address) ? $address->mobile : '' }}">
                                        <p></p>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <textarea name="order_notes" id="order_notes" cols="30" rows="2" placeholder="Order Notes (optional)"
                                            class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="col-md-4">
                        <div class="sub-title">
                            <h2>Order Summary</h2>
                        </div>
                        <div class="card cart-summery">
                            <div class="card-body">
                                @foreach (Cart::content() as $cart)
                                    <div class="d-flex justify-content-between pb-2">
                                        <div class="h6">{{ $cart->name }}</div>
                                        <div class="h6">{{ $cart->price }} X {{ $cart->qty }}</div>
                                    </div>
                                @endforeach
                                <div class="d-flex justify-content-between summery-end">
                                    <div class="h6"><strong>Subtotal</strong></div>
                                    <div class="h6 subtotal"><strong>${{ Cart::subtotal() }}</strong></div>
                                </div>
                                <div class="d-flex justify-content-between mt-2">
                                    <div class="h6"><strong>Shipping</strong></div>
                                    <div class="h6 cart-shipping"><strong>{{ $charge }}</strong></div>
                                    <input type="hidden" name="shippingCharge" class="shippingCharge"
                                        value="{{ $charge }}">
                                </div>
                                <div class="d-flex justify-content-between mt-2">
                                    <div class="h6"><strong>Discount</strong></div>
                                    <div class="h6 cart-discount"><strong>{{ $dp }}</strong></div>
                                    <input type="hidden" class="totalDis" value="{{ $dp }}" name="totalDis">
                                </div>
                                <div class="d-flex justify-content-between mt-2 summery-end">
                                    <div class="h5"><strong>Total</strong></div>
                                    <div class="h5 cart-total"><strong>{{ $total }}</strong></div>
                                    <input type="hidden" class="totalVal" value="{{ $total }}" name="totalVal">
                                </div>
                            </div>
                        </div>

                        <!-- Coupon -->
                        <div class="card">
                            <div class="card-body input-gr0oup apply-coupan mt-4">
                                @php $dis = Session::get('discount'); @endphp
                                <input type="text" id="coupon" placeholder="Coupon Code"
                                    class="form-control coupon" value="{{ $dis ? $dis->code : '' }}">
                                <p></p>
                                <input type="hidden" class="code" name="code"
                                    value="{{ $dis ? $dis->code : '' }}">
                                <i class="fa-solid fa-xmark removeCoupon" style="color: #a81a1a;"></i>
                                <button class="btn btn-dark mt-2 coupon-btn" type="button">Apply Coupon</button>
                            </div>
                        </div>

                        <!-- Payment Options -->
                        <div class="card payment-form mt-4">
                            <h3 class="card-title h5 mb-3">Payment Details</h3>
                            <div class="card-body p-2">
                                <div class="payment-option">
                                    <div class="payment-first">
                                        <input checked type="radio" name="payment" id="paymentOne" value="p-one">
                                        <label for="paymentOne">COD</label>
                                        <br>
                                        <input type="radio" name="payment" id="paymentTwo" value="p-two">
                                        <label for="paymentTwo">Stripe</label>
                                    </div>
                                </div>
                                <div class="pt-4">
                                    <button type="submit" class="btn-dark btn btn-block w-100">Pay Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
@endsection

@section('custom-js')
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
        });

        $('#country').change(function() {
            var country = $(this).val();
            $.get("{{ route('countryChange') }}", {
                id: country
            }, function(response) {
                $('.cart-shipping > strong').html(response.charge);
                $('.cart-total > strong').html(response.subtotal);
                $('.totalVal').val(response.subtotal);
                $('.shippingCharge').val(response.charge);
            });
        });

        $('#paymentOne').click(function() {
            $('.stripPayment').addClass('d-none');
        });
        $('#paymentTwo').click(function() {
            $('.stripPayment').removeClass('d-none');
        });

        $('#checkoutForm').submit(function(e) {
            e.preventDefault();
            var form = $(this);
            $("button[type=submit]").prop('disabled', true);

            $.post("{{ route('user-checkout-store') }}", form.serializeArray(), function(response) {
                $("button[type=submit]").prop('disabled', false);

                if (response.status) {
                    $("input, select, textarea").removeClass('is-invalid');
                    $('.error').removeClass('invalid-feedback').html('');

                    if (response.payment == 'p-one') {
                        // COD
                        window.location.href = "{{ route('user-thank') }}";
                    } else if (response.payment == 'p-two') {
                        // Stripe
                        window.location.href = response.redirectUrl; // Redirect to Stripe Checkout
                    }
                } else {
                    $.each(response.errors, function(key, value) {
                        $(`#${key}`).addClass('is-invalid').siblings('p').addClass(
                            'invalid-feedback').html(value);
                    });
                }
            }, 'json');
        });



        // Coupon logic remains the same

        $('.coupon-btn').click(function(e) {
            e.preventDefault();
            // $("button[type=submit]").prop('disabled', true);
            var coupon = $('#coupon').val();
            var charge = $('.shippingCharge').val();
            $.ajax({
                url: "{{ route('apply-coupon') }}",
                type: 'post',
                data: {
                    coupon: coupon,
                    charge: charge
                },
                dataType: 'json',
                success: function(response) {
                    console.log($('#coupon').length);
                    if (response['status'] == true) {
                        $("input").removeClass('is-invalid');
                        $('.error').removeClass('invalid-feedback').html('');
                        $('.subtotal > strong').html(`$${response.subtotal}`);
                        $('.totalDis').val(response.discount);
                        $('.cart-discount > strong').html(`-$${response.discount}`);
                        $('.cart-total > strong').html(`$${response.total}`);
                        $('.totalVal').val(response.total);
                        $('.code').val(response.dicount_code);
                        // $('.discountCode-session').hide();
                    } else {
                        var errors = response['errors'];
                        console.log(errors);
                        $("input").removeClass('is-invalid');
                        $('.error').removeClass('invalid-feedback').html('');
                        $.each(errors, function(key, value) {
                            $(`#${key}`).addClass('is-invalid').siblings('p').addClass(
                                'invalid-feedback').html(value);
                        })
                    }
                }
            })
        });
        $('.removeCoupon').click(function() {
            var charge = $('.shippingCharge').val();
            $('.coupon').val('');
            $.ajax({
                url: "{{ route('remove-coupon') }}",
                type: 'get',
                data: {
                    charge: charge,
                },
                dataType: 'json',
                success: function(response) {
                    $('.subtotal > strong').html(`$${response.subtotal}`);
                    $('.cart-discount > strong').html(0);
                    $('.totalDis').val('');
                    $('.cart-total > strong').html(`$${response.total}`);
                    $('.totalVal').val(response.total);
                    $('.code').val('');
                }
            })
        })
    </script>
@endsection
