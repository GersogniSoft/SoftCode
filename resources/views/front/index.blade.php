@extends('front.layout')

@section('hero')

    
   <section class="home" id="home">

    <div class="swiper-container home-silider">
        <div class="swiper-wrapper wrapper">
            <div class="swiper-slide slide">
                <div class="content">
                  @foreach ($softcodes as $softcode)

                    <h3>@lang($softcode->home_infos)</h3>

                    <p>
                        @lang($softcode->home_infos_sub)
                    </p>
                    
                  @endforeach

<!-- ShareThis BEGIN --><div class="sharethis-inline-follow-buttons"></div><!-- ShareThis END -->

                </div>
                
                <div class="image">
                    <img src="images/hero-img.png" alt="" srcset="">
                </div>
            </div>

        </div>
      
    </div>

</section>

@endsection


@section('main')

<section class="review blog_left_sidebar" id="review">

    <h1 class="heading">Tutoriels</h1><br>

    <div class=" review-slide">
        <div class="Wrapper">
            @isset($title)
                <div class="row">
                    <div class="column">
                        <h1>{!! $title !!}</h1>
                    </div>
                </div>
            @endisset

            @foreach($posts as $post)
    
                <x-front.brick :post="$post" />
    
            @endforeach

            <br>
            <div class="row" style="margin-left: 40%;">
            
                    {{ $posts->links('front.pagination') }}
            
            </div><br><br>
        </div>
    </div>
   
    
</section>


@endsection

