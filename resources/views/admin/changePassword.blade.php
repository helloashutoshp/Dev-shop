@extends('admin.layouts.app')

@section('title')
    Change Password
@endsection

@section('content')
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Change Password</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('admin-dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item active">Change Password</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Change Password</h3>
                            </div>
                            <div class="card-body">
                                <form action="" id="passwordChange">
                                    <div class="mb-3">
                                        <label for="old_password">Old Password</label>
                                        <input type="password" name="old_password" id="old_password"
                                            placeholder="Old Password" class="form-control">
                                        <p class="error"></p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="new_password">New Password</label>
                                        <input type="password" name="new_password" id="new_password"
                                            placeholder="New Password" class="form-control">
                                        <p class="error"></p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="confirm_password">Confirm Password</label>
                                        <input type="password" name="confirm_password" id="confirm_password"
                                            placeholder="Confirm Password" class="form-control">
                                        <p class="error"></p>
                                    </div>
                                    <div class="d-flex">
                                        <button type="submit" class="btn btn-primary">Change Password</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@section('custom')
    <script>
        $('#passwordChange').submit(function(e) {
            e.preventDefault();
            $("button[type=submit]").prop('disabled', true);
            $.ajax({
                url: '{{ route('admin-password-change') }}',
                type: 'POST',
                data: $(this).serialize(),
                success: function(response) {
                    $("button[type=submit]").prop('disabled', false);
                    if (response['status'] == true) {
                        $("input[type='password']").removeClass('is-invalid');
                        $('.error').removeClass('invalid-feedback').html('');
                        window.location.href = "{{ route('admin-dashboard') }}";
                    } else {
                        var errors = response['errors'];
                        $("input[type='password']").removeClass('is-invalid');
                        $('.error').removeClass('invalid-feedback').html('');
                        $.each(errors, function(key, value) {
                            $(`#${key}`).addClass('is-invalid').siblings('p').addClass(
                                'invalid-feedback').html(value);
                        })
                    }
                }
            })
        })
    </script>
@endsection 