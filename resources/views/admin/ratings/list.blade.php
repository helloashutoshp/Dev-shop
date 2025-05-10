@extends('admin.layouts.app')

@section('content')
    <section class="content-header">
        <div class="container-fluid my-2">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Ratings</h1>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="container-fluid">
            <div class="card">
                <form action="" method="get">
                    <div class="card-header">
                        @include('admin.message')
                        <div class="card-title">
                            <button type="button" onclick="window.location.href ='{{ route('admin-rating-list') }}'"
                                class="btn btn-default">Reset</button>
                        </div>
                        <div class="card-tools">
                            <div class="input-group input-group" style="width: 250px;">
                                <input value="{{ Request::get('keyword') }}" type="text" name="keyword"
                                    class="form-control float-right" placeholder="Search">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-default">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Product</th>
                                <th>comment</th>
                                <th>Ratings</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($ratings->isNotEmpty())
                                <?php $i = ($ratings->currentPage() - 1) * $ratings->perPage();
                                $i = $i + 1;
                                ?>
                                @foreach ($ratings as $rating)
                                    @php
                                        $stars = ($rating->rating * 100) / 5;
                                    @endphp
                                    <tr>
                                        <td>{{ $i }}</td>
                                        <td>{{ $rating->username }}</td>
                                        <td>{{ $rating->product->title }}</td>
                                        <td>{{ $rating->comment }}</td>
                                        <td>
                                            <div class="star-rating mt-2" title="70%">
                                                <div class="back-stars">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>

                                                    <div class="front-stars" style="width: {{ $stars }}%">
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        @if ($rating->status == 0)
                                            <td>
                                                <a href="{{ route('edit-status', encrypt($rating->id)) }}"
                                                    class="badge badge-danger">
                                                    Block
                                                </a>
                                            </td>
                                        @else
                                            <td>
                                                <a href="{{ route('edit-status', encrypt($rating->id)) }}"
                                                    class="badge badge-success">
                                                    Unblock
                                                </a>
                                            </td>
                                        @endif
                                    </tr>
                                    <?php $i++; ?>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="5">No records found</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
                <div class="card-footer clearfix">
                    {{ $ratings->links() }}
                </div>
            </div>
        </div>
        <!-- /.card -->
    </section>
@endsection
@section('custom')
    <script>
        // function deleteCategory(id) {
        //     if (confirm('Do you really want to delete this ?')) {
        //         $.ajax({
        //             url: `{{ url('/admin/category/delete') }}/${id}`,
        //             type: 'get',
        //             dataType: 'json',
        //             success: function(response) {
        //                 if (response.status == true) {
        //                     window.location.href = "{{ route('category-list') }}"
        //                 }
        //             }
        //         });
        //     }
        // }
    </script>
@endsection
