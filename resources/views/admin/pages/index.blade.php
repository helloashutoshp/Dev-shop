@extends('admin.layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">					
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Pages</h1>
                </div>
                <div class="col-sm-6">
                    <a href="{{ route('admin-pages-create') }}" class="btn btn-primary float-sm-right">Add New Page</a>
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
            <div class="card">
                <div class="card-body table-responsive p-0">								
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Slug</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($pages->isNotEmpty())
                                @foreach($pages as $page)
                                <tr>
                                    <td>{{ $page->id }}</td>
                                    <td>{{ $page->name }}</td>
                                    <td>{{ $page->slug }}</td>
                                    <td>
                                        <a href="{{ route('admin-pages-edit', encrypt($page->id)) }}" class="btn btn-sm btn-info">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="javascript:void(0)" onclick="deletePage('{{ encrypt($page->id) }}')" class="btn btn-sm btn-danger">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="5">Records not found</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>										
                </div>
            </div>
        </div>
        <!-- /.card -->
    </section>
    <!-- /.content -->
@endsection

@section('custom')
<script>
    function deletePage(id) {
        if(confirm("Are you sure you want to delete?")) {
            $.ajax({
                url: '{{ route("admin-pages-delete") }}',
                data: {id: id},
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    if(response.status == true) {
                        window.location.href = "{{ route('admin-pages-list') }}";
                    }
                }
            });
        }
    }
</script>
@endsection 