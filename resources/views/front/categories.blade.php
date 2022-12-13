@extends('front.layout')

@section('main')

<!-- post
================================================== -->

<div class="blog_left_sidebar detailPost">
                        
    <div class="image">
        <img src="/storage/categories/categoriesimages/{{ $categorys->image }} " alt="">
    </div>
    
    <section class=" review" id="review">
        <h3 class="titre">
                <a href="{{ route('category', $categorys->slug) }}">{{ $categorys->title }}</a>
        </h3>
        
        <p class="infoPost">
           {{$categorys->info}}
        </p>
        <p class="telech">Téléchargé le projet complet <a href="">ici</a> </p> <br><br>

        <div class="corps laravel" >

            <aside class="categories">
                @foreach($categorys->gersos as $gerso)
                    <h3>{{ $gerso->title }}</h3>
                        <ol>
                            @foreach($gerso->posts as $pst)
        
                                <li><a href="{{ route('posts.display', $pst->slug) }}" class=""><p>{{ $pst->title }} </p></a></li>
                    
                            @endforeach
                            
                        </ol><br>
                @endforeach
            </aside>

        </div>
                
    </section>

</div>

@endsection


