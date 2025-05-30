@extends('front.layout.layout')
@section('title')
    Wishlist
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
                            <h2 class="h5 mb-0 pt-2 pb-2">My Wishlist</h2>
                        </div>
                        @if ($items->isNotEmpty())
                            <div class="card-body p-4">
                                @foreach ($items as $item)
                                    <div class="d-sm-flex justify-content-between mt-lg-4 mb-4 pb-3 pb-sm-2 border-bottom">
                                        <div class="d-block d-sm-flex align-items-start text-center text-sm-start">
                                            <a class="d-block flex-shrink-0 mx-auto me-sm-4"
                                                href="{{ route('product', $item->product->slug) }}" style="width: 10rem;">
                                                @php
                                                    $image = getProductImg($item->product_id);
                                                @endphp
                                                @if ($image)
                                                    <img class="img-fluid"
                                                        src="{{ asset('uploads/product/large/' . $image->image) }}"
                                                        alt="">
                                                @else
                                                    <img class="img-fluid"
                                                        src="{{ asset('uploads/product/large/404.jpg') }}" alt="">
                                                @endif
                                            </a>
                                            <div class="pt-2">
                                                <h3 class="product-title fs-base mb-2">
                                                    <a href="{{ route('product', $item->product->slug) }}">
                                                        {{ $item->product->title }}
                                                    </a>
                                                </h3>
                                                <div class="fs-lg text-accent pt-2">
                                                    ${{ number_format($item->product->price, 2) }}</div>
                                            </div>
                                        </div>
                                        <div class="pt-2 ps-sm-3 mx-auto mx-sm-0 text-center">
                                            <button class="btn btn-outline-danger btn-sm" type="button"
                                                onclick="removeFromWishlist({{ $item->product->id }})">
                                                <i class="fas fa-trash-alt me-2"></i>Remove
                                            </button>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @else
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h3>Your wishlist is empty</h3>
                                    <p>Add some products to your wishlist</p>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('custom-js')
    <script>
        function removeFromWishlist(id) {
            if (confirm("Are you sure you want to remove this item from wishlist?")) {
                $.ajax({
                    url: '{{ route('remove.wishlist') }}',
                    type: 'post',
                    data: {
                        id: id,
                        _token: '{{ csrf_token() }}'
                    },
                    dataType: 'json',
                    success: function(response) {
                        if (response.status == true) {
                            window.location.href = '{{ route('user-wishlist') }}';
                        } else {
                            alert(response.message);
                        }
                    }
                });
            }
        }
    </script>
@endsection
