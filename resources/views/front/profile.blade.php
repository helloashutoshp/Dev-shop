@extends('front.layout.layout')
@section('title')
    Profile
@endsection
@section('content')
    <section class="section-5 pt-3 pb-3 mb-3 bg-white">
        <div class="container">
            <div class="light-font">
                <ol class="breadcrumb primary-color mb-0">
                    <li class="breadcrumb-item"><a class="white-text" href="#">My Account</a></li>
                    <li class="breadcrumb-item">Settings</li>
                </ol>
            </div>
        </div>
    </section>
    <section class=" section-11 ">
        <div class="container  mt-5">
            @include('admin.message')

            <div class="row">
                <div class="col-md-3">
                    @include('front.layout.sidebar')
                </div>
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-header">
                            <h2 class="h5 mb-0 pt-2 pb-2">Personal Information</h2>
                        </div>
                        <div class="card-body p-4">
                            <div class="row">
                                <form action="" id="profile-update">
                                    <div class="mb-3">
                                        <label for="name">Name</label>
                                        <input type="hidden" name="user_id" id="user_id" value="{{ $user->id }}">
                                        <input type="text" name="name" id="name" placeholder="Enter Your Name"
                                            class="form-control" value="{{ $user->name }}">
                                        <p></p </div>
                                        <div class="mb-3">
                                            <label for="email">Email</label>
                                            <input type="text" readonly name="email" id="email"
                                                placeholder="Enter Your Email" class="form-control"
                                                value="{{ $user->email }}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone">Phone</label>
                                            <input type="text" name="phone" id="phone"
                                                placeholder="Enter Your Phone" class="form-control"
                                                value="{{ $user->phone }}">
                                            <p></p>
                                        </div>
                                        <div class="d-flex">
                                            <button type="submit" class="btn btn-dark profile-update">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h2 class="h5 mb-0 pt-2 pb-2">Update Address</h2>
                        </div>
                        <div class="card-body p-4">
                            <div class="row">
                                <form action="" id="address-update">
                                    <input type="hidden" name="address_id" id="address_id" value="{{ !empty($address) ? $address->id : '' }}">
                                    @if ($country->isNotEmpty())
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <select name="country" id="country" class="form-control">
                                                    <option value="">Select a Country</option>
                                                    @foreach ($country as $cnt)
                                                        <option
                                                            {{ !empty($address) && $address->country_id == $cnt->id ? 'selected' : '' }}
                                                            value="{{ $cnt->id }}">{{ $cnt->name }}</option>
                                                    @endforeach
                                                </select>
                                                <p></p>
                                            </div>
                                        </div>
                                    @endif
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <textarea name="address" id="address" cols="30" rows="3" placeholder="Address" class="form-control">{{ !empty($address) ? $address->address : '' }}</textarea>
                                            <p></p>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <input type="text" name="appartment" id="appartment" class="form-control"
                                                placeholder="Apartment, suite, unit, etc. (optional)"
                                                value="{{ !empty($address) ? $address->appartment : '' }}">
                                            <p></p>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <input type="text" name="city" id="city" class="form-control"
                                                placeholder="City" value="{{ !empty($address) ? $address->city : '' }}">
                                            <p></p>

                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <input type="text" name="state" id="state" class="form-control"
                                                placeholder="State" value="{{ !empty($address) ? $address->state : '' }}">
                                            <p></p>

                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <input type="text" name="zip" id="zip" class="form-control"
                                                placeholder="Zip" value="{{ !empty($address) ? $address->zip : '' }}">
                                            <p></p>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <input type="text" name="address_mobile" id="address_mobile" class="form-control"
                                                placeholder="Mobile No."
                                                value="{{ !empty($address) ? $address->mobile : '' }}">
                                            <p></p>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <button type="submit" class="btn btn-dark address-update">Update Address</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
@endsection

@section('custom-js')
    <script>
        $('#profile-update').submit(function(e) {
            e.preventDefault();
            $.ajax({
                url: "{{ route('profile.update') }}",
                type: 'post',
                data: $(this).serializeArray(),
                dataType: 'json',
                success: function(response) {
                    if (response.status == true) {
                        window.location.href = "{{ route('user-profile') }}";
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
            });
        });
        $('#address-update').submit(function(e) {
            e.preventDefault();
            $.ajax({
                url: "{{ route('address.update') }}",
                type: 'post',
                data: $(this).serializeArray(),
                dataType: 'json',
                success: function(response) {
                    if (response.status == true) {
                        window.location.href = "{{ route('user-profile') }}";
                    } else {
                        var errors = response['errors'];
                        $("input,select").removeClass('is-invalid');
                        $('.error').removeClass('invalid-feedback').html('');
                        $.each(errors, function(key, value) {
                            $(`#${key}`).addClass('is-invalid').siblings('p').addClass(
                                'invalid-feedback').html(value);
                        })
                    }
                }
            });
        });
    </script>
@endsection
