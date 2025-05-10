@extends('front.layout.layout')
@section('title')
    Product
@endsection
@section('content')
    <section class="section-5 pt-3 pb-3 mb-3 bg-white">
        <div class="container">
            <div class="light-font">
                <ol class="breadcrumb primary-color mb-0">
                    <li class="breadcrumb-item"><a class="white-text" href="{{ route('home') }}">Home</a></li>
                    <li class="breadcrumb-item"><a class="white-text" href="{{ route('shop') }}">Shop</a></li>
                    <li class="breadcrumb-item">{{ $product->title }}</li>
                </ol>
            </div>
        </div>
    </section>

    <section class="section-7 pt-3 mb-3">
        <div class="container">
            @include('admin.message')
            <div class="row ">
                <div class="col-md-5">
                    <div id="product-carousel" class="carousel slide" data-bs-ride="carousel">
                        @if ($product->product_img->isNotEmpty())
                            <div class="carousel-inner bg-light">
                                @foreach ($product->product_img as $key => $image)
                                    <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                                        <img class="w-100 h-100" src="{{ asset('uploads/product/large/' . $image->image) }}"
                                            alt="Image">
                                    </div>
                                @endforeach
                            </div>
                        @else
                            <div class="no-image">
                                <img class="w-100 h-100" src="{{ asset('uploads/product/large/404.jpg') }}" alt="Image">
                            </div>
                        @endif
                        @if ($product->product_img->count() > 1)
                            <a class="carousel-control-prev" href="#product-carousel" data-bs-slide="prev">
                                <i class="fa fa-2x fa-angle-left text-dark"></i>
                            </a>
                            <a class="carousel-control-next" href="#product-carousel" data-bs-slide="next">
                                <i class="fa fa-2x fa-angle-right text-dark"></i>
                            </a>
                        @endif

                    </div>
                </div>
                <div class="col-md-7">
                    <div class="bg-light right">
                        <h1>{{ $product->title }}</h1>
                        <div class="d-flex mb-3">
                                <div class="star-rating  text-primary mr-2" title="70%">
                                    <div class="back-stars">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        @php
                                            $rating_percentage = ($avgRating * 100) / 5;
                                        @endphp
                                        <div class="front-stars" style="width: {{ $rating_percentage }}%">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            <small class="pt-1">({{ $noRating > 0 ? $noRating : 0 }} Reviews)</small>
                        </div>
                        @if ($product->compare_price)
                            <h2 class="price text-secondary"><del>${{ $product->compare_price }}</del></h2>
                        @endif
                        <h2 class="price ">${{ $product->price }}</h2>
                        {!! $product->short_description !!}

                        <a href="" onClick="addToCart(event,{{ $product->id }})" class="btn btn-dark"><i
                                class="fas fa-shopping-cart"></i> &nbsp;ADD TO CART</a>
                    </div>
                </div>

                <div class="col-md-12 mt-5">
                    <div class="bg-light">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="description-tab" data-bs-toggle="tab"
                                    data-bs-target="#description" type="button" role="tab" aria-controls="description"
                                    aria-selected="true">Description</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="shipping-tab" data-bs-toggle="tab" data-bs-target="#shipping"
                                    type="button" role="tab" aria-controls="shipping" aria-selected="false">Shipping &
                                    Returns</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews"
                                    type="button" role="tab" aria-controls="reviews"
                                    aria-selected="false">Reviews</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="description" role="tabpanel"
                                aria-labelledby="description-tab">
                                {!! $product->description !!}
                            </div>
                            <div class="tab-pane fade" id="shipping" role="tabpanel" aria-labelledby="shipping-tab">
                                {!! $product->shipping_return !!}

                            </div>
                            <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                <div class="col-md-8">
                                    <form id="review-form">
                                        <div class="row">
                                            <h3 class="h4 pb-3">Write a Review</h3>
                                            <div class="form-group col-md-6 mb-3">
                                                <label for="name">Name</label>
                                                <input type="hidden" name="product_id" value="{{ $product->id }}">
                                                <input type="text" class="form-control" name="name" id="name"
                                                    placeholder="Name">
                                                <p class="error"></p>
                                            </div>
                                            <div class="form-group col-md-6 mb-3">
                                                <label for="email">Email</label>
                                                <input type="text" class="form-control" name="email" id="email"
                                                    placeholder="Email">
                                                <p class="error"></p>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="rating">Rating</label>
                                                <br>
                                                <div class="rating" style="width: 10rem">
                                                    <input id="rating-5" type="radio" name="rating"
                                                        value="5" /><label for="rating-5"><i
                                                            class="fas fa-3x fa-star"></i></label>
                                                    <input id="rating-4" type="radio" name="rating"
                                                        value="4" /><label for="rating-4"><i
                                                            class="fas fa-3x fa-star"></i></label>
                                                    <input id="rating-3" type="radio" name="rating"
                                                        value="3" /><label for="rating-3"><i
                                                            class="fas fa-3x fa-star"></i></label>
                                                    <input id="rating-2" type="radio" name="rating"
                                                        value="2" /><label for="rating-2"><i
                                                            class="fas fa-3x fa-star"></i></label>
                                                    <input id="rating-1" type="radio" name="rating"
                                                        value="1" /><label for="rating-1"><i
                                                            class="fas fa-3x fa-star"></i></label>
                                                    <p class="error"></p>
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="">How was your overall experience?</label>
                                                <textarea name="review" id="review" class="form-control" cols="30" rows="10"
                                                    placeholder="How was your overall experience?"></textarea>
                                                <p class="error"></p>
                                            </div>
                                            <div>
                                                <button class="btn btn-dark">Submit</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                                <div class="col-md-12 mt-5">
                                    <div class="overall-rating mb-3">
                                        <div class="d-flex">
                                            @if ($avgRating > 0)
                                                <h1 class="h3 pe-3">{{ $avgRating }}</h1>
                                            @else
                                                <h1 class="h3 pe-3">0</h1>
                                            @endif
                                            <div class="star-rating mt-2" title="70%">
                                                <div class="back-stars">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    @php
                                                        $rating_percentage = ($avgRating * 100) / 5;
                                                    @endphp
                                                    <div class="front-stars" style="width: {{ $rating_percentage }}%">
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pt-2 ps-2">({{ $noRating > 0 ? $noRating : 0 }} Reviews)</div>
                                        </div>

                                    </div>
                                    @if ($product->rating->isNotEmpty())
                                        @foreach ($product->rating as $rating)
                                            @php
                                                $rating_percentage = ($rating->rating * 100) / 5;
                                            @endphp
                                            <div class="rating-group mb-4">
                                                <span> <strong>{{ $rating->username }}</strong></span>
                                                <div class="star-rating mt-2" title="70%">
                                                    <div class="back-stars">
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>

                                                        <div class="front-stars"
                                                            style="width: {{ $rating_percentage }}%">
                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                            <i class="fa fa-star" aria-hidden="true"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="my-3">
                                                    <p>
                                                        {{ $rating->comment }}
                                                    </p>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                        <div class="alert alert-warning">No reviews found</div>
                                    @endif
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <section class="pt-5 section-8">
        <div class="container">
            <div class="section-title">
                <h2>Related Products</h2>
            </div>
            @if ($items->isNotEmpty())
                <div class="col-md-12">
                    <div id="related-products" class="carousel related-slick">
                        @foreach ($items as $item)
                            @php
                                $image = $item->product_img->first();
                            @endphp
                            <div class="card product-card">
                                <div class="product-image position-relative">
                                    @if ($image)
                                        <a href="{{ route('product', $item->slug) }}" class="product-img"><img
                                                class="card-img-top"
                                                src="{{ asset('uploads/product/large/' . $image->image) }}"
                                                alt=""></a>
                                    @else
                                        <a href="{{ route('product', $item->slug) }}" class="product-img">

                                            <img class="card-img-top" src="{{ asset('uploads/product/large/404.jpg') }}"
                                                alt="">
                                        </a>
                                    @endif
                                    <a class="whishlist" href="222"><i class="far fa-heart"></i></a>

                                    <div class="product-action">
                                        <a class="btn btn-dark" href=""
                                            onClick="addToCart(event,{{ $product->id }})">
                                            <i class="fa fa-shopping-cart"></i> Add To Cart
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body text-center mt-3">
                                    <a class="h6 link"
                                        href="{{ route('product', $item->slug) }}">{{ $item->title }}</a>
                                    <div class="price mt-2">
                                        <span class="h5"><strong>${{ $item->price }}</strong></span>
                                        <span class="h6 text-underline"><del>${{ $item->compare_price }}</del></span>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endif

        </div>
    </section>
@endsection
@section('custom-js')
    <script>
        $('.related-slick').slick({
            infinite: true,
            speed: 300,
            slidesToShow: 4,
            // variableWidth: true,
            autoplay: true,
        });

        $('#review-form').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();
            $.ajax({
                url: '{{ route('review.store') }}',
                type: 'POST',
                data: formData,
                success: function(response) {
                    if (response.status == true) {
                        $("input,textarea").removeClass('is-invalid');
                        $('.error').removeClass('invalid-feedback').html('');
                        window.location.href = "{{ route('product', $product->slug) }}"
                    } else {
                        var errors = response['errors'];
                        $("input,textarea").removeClass('is-invalid');
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
