@extends('front.layout.layout')
@section('title')
    Profile
@endsection
@section('content')
    <section class="section-5 pt-3 pb-3 mb-3 bg-white">
        @include('admin.message')
        <div class="container">
            <div class="light-font">
                <ol class="breadcrumb primary-color mb-0">
                    <li class="breadcrumb-item"><a class="white-text" href="{{ route('home') }}">Home</a></li>
                    <li class="breadcrumb-item">{{ $page->name }}</li>
                </ol>
            </div>
        </div>
    </section>

    @if ($page->slug == 'contact-us')
        <section class=" section-10">
            <div class="container">
                <div class="section-title mt-5 ">
                    <h2>{{ $page->name }}</h2>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mt-3 pe-lg-5">
                        {!! $page->content !!}
                    </div>

                    <div class="col-md-6">
                        <form id="contactForm" name="contact-form">
                            <div class="mb-3">
                                <label class="mb-2" for="name">Name</label>
                                <input class="form-control" id="name" type="text" name="name"
                                    data-error="Please enter your name">
                                <p class="error"></p>
                                <div class="help-block with-errors"></div>
                            </div>

                            <div class="mb-3">
                                <label class="mb-2" for="email">Email</label>
                                <input class="form-control" id="email" type="email" name="email"
                                    data-error="Please enter your Email">
                                <p class="error"></p>
                                <div class="help-block with-errors"></div>
                            </div>

                            <div class="mb-3">
                                <label class="mb-2">Subject</label>
                                <input class="form-control" id="subject" type="text" name="subject"
                                    data-error="Please enter your message subject">
                                <p class="error"></p>
                                <div class="help-block with-errors"></div>
                            </div>

                            <div class="mb-3">
                                <label for="message" class="mb-2">Message</label>
                                <textarea class="form-control" rows="3" id="message" name="message" data-error="Write your message"></textarea>
                                <p class="error"></p>
                                <div class="help-block with-errors"></div>
                            </div>

                            <div class="form-submit">
                                <button class="btn btn-dark" type="submit" id="form-submit"><i
                                        class="material-icons mdi mdi-message-outline"></i> Send Message</button>
                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    @else
        <section class=" section-10">
            <div class="container">
                <h1 class="my-3">{{ $page->name }}</h1>
                {!! $page->content !!}
            </div>
        </section>
    @endif
@endsection

@section('custom-js')
    <script>
        $('#contactForm').submit(function(e) {
            e.preventDefault();
            $("button[type='submit']").prop('disabled', true);
            $.ajax({
                url: "{{ route('contact.us') }}",
                type: 'post',
                data: $(this).serializeArray(),
                dataType: 'json',
                success: function(response) {
                    $("button[type='submit']").prop('disabled', false);
                    if (response.status == true) {
                        $("input").removeClass('is-invalid');
                        $('.error').removeClass('invalid-feedback').html('');
                        window.location.href = "{{ route('contact.us') }}";
                    } else {
                        var errors = response['errors'];
                        $("input").removeClass('is-invalid');
                        $('.error').removeClass('invalid-feedback').html('');
                        $.each(errors, function(key, value) {
                            $(`#${key}`).addClass('is-invalid').siblings('p').addClass(
                                'invalid-feedback').html(value);
                        })
                    }
                },
                error: function(xhr, status, error) {
                    console.log(xhr.responseJSON);
                }
            })
        })
    </script>
@endsection
