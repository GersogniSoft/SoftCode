@extends('front.layout')

@section('main')

<!-- post
================================================== -->
<div class="blog_left_sidebar" style="">
                        
    <section class="review" id="review">

        <h3 class="titre">
            @lang($page->title) 
        </h3><br><br>
        
        <div class="corps laravel" style="">
         
            <aside class="categories">

                <p class="infoPost" >
                    {!! $page->body !!}
                </p>
                

            </aside>
        </div>
    
    </section>

</div>

@endsection
