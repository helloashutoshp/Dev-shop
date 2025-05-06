@extends('front.layout.layout')
@section('title')
    Reset Password
@endsection
@section('content')
    <section class="section-5 pt-3 pb-3 mb-3 bg-white">
        <div class="container">
            <div class="light-font">
                <ol class="breadcrumb primary-color mb-0">
                    <li class="breadcrumb-item"><a class="white-text" href="#">Home</a></li>
                    <li class="breadcrumb-item">Reset Password</li>
                </ol>
            </div>
        </div>
    </section>

    <section class=" section-10">
        @include('front.message')
        <div class="container">
            <div class="login-form">
                <form action="{{route('reset-password-action')}}" method="post">
                    @csrf
                    <h4 class="modal-title">Reset Password</h4>
                    <div class="form-group">
                        <input type="hidden" name="token" value="{{$token}}">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control @error('password') is-invalid @enderror"
                            placeholder="Password" value="{{old('password')}}">
                        @error('password')
                            <p class="invalid-feedback">{{ $message }}</p>
                        @enderror
                    </div>
                    <div class="form-group">
                        <input type="password" name="password_confirmation" class="form-control @error('password_confirmation') is-invalid @enderror"
                            placeholder="Confirm Password">
                        @error('password_confirmation')
                            <p class="invalid-feedback">{{ $message }}</p>
                        @enderror
                    </div>
                    <input type="submit" class="btn btn-dark btn-block btn-lg" value="Update Password">
                </form>
            </div>
        </div>
    </section>
@endsection
