@extends('admin.layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Edit Page</h1>
                </div>
                <div class="col-sm-6">
                    <a href="{{ route('admin-pages-list') }}" class="btn btn-primary float-sm-right">Back</a>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="container-fluid">
            @include('admin.message')
            <form action="" id="pageForm" name="pageForm">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="title">Title</label>
                                    <input type="hidden" name="id" id="id" value="{{ $page->id }}">
                                    <input type="text" name="title" id="title" class="form-control"
                                        placeholder="Title" value="{{ $page->name }}">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="slug">Slug</label>
                                    <input type="text" name="slug" id="slug" class="form-control"
                                        placeholder="Slug" value="{{ $page->slug }}" readonly>
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="content">Content</label>
                                    <textarea name="content" id="content" class="form-control summernote" cols="30" rows="10"
                                        placeholder="Content">{{ $page->content }}</textarea>
                                    <p></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pb-5 pt-3">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="{{ route('admin-pages-list') }}" class="btn btn-outline-dark ml-3">Cancel</a>
                </div>
            </form>
        </div>
        <!-- /.card -->
    </section>
    <!-- /.content -->
@endsection

@section('custom')
    <script>
        $(document).ready(function() {
            $("#title").change(function() {
                element = $(this);
                $("button[type=submit]").prop('disabled', true);
                $.ajax({
                    url: '{{ route('get-slug') }}',
                    type: 'get',
                    data: {
                        title: element.val()
                    },
                    dataType: 'json',
                    success: function(response) {
                        $("button[type=submit]").prop('disabled', false);
                        if (response["status"] == true) {
                            $("#slug").val(response["slug"]);
                        }
                    }
                });
            });

            $("#pageForm").submit(function(event) {
                event.preventDefault();
                var formArray = $(this).serializeArray();
                $("button[type='submit']").prop('disabled', true);
                $.ajax({
                    url: '{{ route('admin-pages-update') }}',
                    type: 'post',
                    data: formArray,
                    dataType: 'json',
                    success: function(response) {
                        $("button[type='submit']").prop('disabled', false);
                        if (response["status"] == true) {
                            window.location.href = "{{ route('admin-pages-list') }}";
                        } else {
                            var errors = response['errors'];
                            $(".error").removeClass('invalid-feedback').html('');
                            $("input[type='text'], select, input[type='number']").removeClass(
                                'is-invalid');
                            $.each(errors, function(key, value) {
                                $(`#${key}`).addClass('is-invalid')
                                    .siblings('p')
                                    .addClass('invalid-feedback')
                                    .html(value);
                            });
                        }
                    }
                });
            });
        });
    </script>
@endsection
