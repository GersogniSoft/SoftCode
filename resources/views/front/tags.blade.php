@extends('front.layout')

@section('main')

<section class="review blog_left_sidebar" id="review">

    <h1 class="heading">@lang('Liste de cours')</h1><br>

    <div class=" review-slide">
        <div class="Wrapper">
            @isset($title)
                <div class="container row">
                    <div class="column">
                        <h1>{!! $title !!}</h1>
                    </div>
                </div>
            @endisset

            @foreach($posts as $post)
                        
            <a href="{{ route('posts.display', $post->slug) }}">
                <div class="slide"> 
                    <div class="user">
                        <img src="{{ getImage($post, true) }}" alt="">
                        <div class="user-info col-lg-9" style="min-height:50px;">
                            <h4><span><i class="fa fa-mail-forward"></i>
                                </span> <strong> {{ $post->user->name }}</strong> 
                                <span class="date"> {{formatDate($post->created_at)}}</span> 
                            </h4>
                            <h3>{{ $post->title }}</h3>
                            <p >{{ substr($post->excerpt, 0, 170) }}</p>
                            
                        </div>
                    </div>
                </div>
            </a>
            

            @endforeach

            <br>
            <div class="row" style="margin-left: 40%;height:50px;">
            
                    {{ $posts->links('front.pagination') }}
            
            </div><br><br>

        </div>
    </div>
   
</section>

@endsection