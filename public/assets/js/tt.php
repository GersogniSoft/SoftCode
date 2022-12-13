<!DOCTYPE html>
<html class="no-js" lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>{{ isset($post) && $post->seo_title ? $post->seo_title :  config('app.name') }}</title>
    <meta name="description" content="{{ isset($post) && $post->meta_description ? $post->meta_description : __(config('app.description')) }}">
    <meta name="author" content="{{ isset($post) ? $post->user->name : __(config('app.author')) }}">
    @if(isset($post) && $post->meta_keywords)
        <meta name="keywords" content="{{ $post->meta_keywords }}">
    @endif

    <link rel="stylesheet" href="{{ asset('lib/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href=" {{asset('lib/font-awesome/css/font-awesome.min.css')}} ">
    <link rel="stylesheet" href="{{asset('lib/swiper/swiper-bundle.min.css')}}">
    <link href="{{asset('lib/icofont/icofont.min.css')}}" rel="stylesheet">
    <link href="{{asset('lib/ionicons/css/ionicons.min.css')}}" rel="stylesheet">
 
    <link rel="stylesheet" href="{{asset('css/st.css')}}">
 
</head>

<body >

  
   <!-- HEADER -->
   <header>
        
        <!-- MAIN HEADER -->
        <div id="header">
            <!-- container -->
            <div class="flex_bar">
              
                <div class="header-logo">
                    <a href="{{ route('home') }}" class="logo">
                        SoftCode.
                    </a>
                </div>
                  
              
                <div class="nav-menu">
                    <nav class="nav-menu d-none d-lg-block" id="responsive-nav">
                        <ul>
                            <li class="active"><a href="{{ route('home') }}">@lang('Home')</a></li>
                          
                                <li><a href="">Administration</a></li>
                          
                            <li class="drop-down"><a href="">@lang('Categories')</a>
                                <ul>
                                    @foreach($categories as $category)
                                        <li><a href="{{ route('category', $category->slug) }}">{{ $category->title }}</a></li>
                                    @endforeach    
                                </ul>
                            </li>
                               
                        </ul>
                    </nav>
                </div>
                
                <div class="header-ctn">
                         
                    <div class="menu-toggle">
                        <div class="icons">
                            <i class="fa fa-search" id="search-icon"></i>
                          

                
                                <a href="" class="gersog">
                                    <img class="avatar" src="  " alt="" srcset="">
                                </a>
                                <a href="" class="gersogni"> </a> 
                         

                        </div>
                    </div>
    
                    <div class="icons menu-toggle">
                        <a href="#">
                            <i class="fa fa-bars" id="menu-bars"></i>
                        </a>
                    </div>
                     
                </div>
                   
            </div>
          
        </div>
     
    </header>
    <!-- /HEADER -->

    <form role="search" method="get"  action="{{ Route('posts.search') }}" id="search-form">
        <input id="search" type="search" name="search" placeholder="@lang('Search for...')" title="@lang('Search for:')" autocomplete="off">
        <label for="search" class="fa fa-search"></label>
        <i class="fa fa-times" id="close"></i>
    </form>

    

    <!-- ======= Hero Section ======= -->

    <section class="section home" id="home" style="background-image: url('images/hero-bg.jpg')">

        <!-- hero
        ================================================== -->
        @yield('hero')
    
    </section>
    


 <!-- content
    ================================================== -->
    <section  class="blog_area section-padding">

        <article class="container ">

            <div class="row">

                    <div class="col-lg-8 mb-5 mb-lg-0">

                        @yield('main')  

                    </div>
                        <!-- end s-entry__entry-content -->



                        <div class="col-lg-4 s-content__pagenav ">

                            <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget">
                                <h4>Suivez nous sur </h4><br>
                                <div class="btnRow">
                                    <a href="" class="btnn">
                                        <img src=" {{asset('images/icons8-facebook-48.png')}} " alt="" srcset="">
                                        Facebook
                                    </a>

                                    <a href="" class="btnn">
                                        <img src="{{asset('images/icons8-facebook-48.png')}}" alt="" srcset="">
                                        Google
                                    </a>
                                </div>
                            </aside>

                            <aside class="categories">
                               <h4>Category</h4>

                               <ul>
                                    @foreach($categories as $category)
                                        <li><a href="{{ route('category', $category->slug) }}">{{ $category->title }}</a></li>
                                    @endforeach    
                                </ul>
                       
                            </aside>

                        
                            <aside class="recent">
                                <h4>Recent Post</h4>

                                @foreach($heros as $post)
                                
                                    <div class="post_item">
                                        <img src="{{ getImage($post, true) }}" alt="post">
                                        <div class="media-body">
                                            <a href="{{ route('posts.display', $post->slug) }}">
                                                {{ $post->title}}
                                            </a>
                                            <p> {{formatDat($post->created_at)}} </p>
                                        </div>
                                    </div>

                                @endforeach
                                
                            </aside>

                        <aside class="categories">
                            <h4>META</h4>
                            <ul>
                                <li>
                                    <a href="#" class="">
                                        <p>Inscription</p>
                                        <p>(37)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <p>Connexion</p>
                                    
                                    </a>
                                </li> 
                            </ul>
                        </aside>

                        <aside class="categories">
                            <h4>M'offrire un café</h4>
                            <ul>
                                <li>
                                    <a href="#" class="">
                                        <p>Si vous appreciez mon travail</p>
                                    </a>
                                    <p>merci à tout les genereux donateurs</p>
                                </li>
                            </ul>
                        </aside>
                            </div>
                            
                        </div>
            </div>
        </article>
    </section><br><br><br>


    
       <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">About us</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Services</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
              <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
              <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
            </div>

          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam
                 noster magna veniam enim veniam illum dolore legam minim quorum culpa
                  amet magna export quem marada parida nodela caramase seza.</p>
          </div>

        </div>
      </div>
    </div>

  </footer><!-- End Footer -->

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    
    <script src="{{asset('js/jquery.min.js')}} "></script>
    <script src= "{{ asset('lib/bootstrap/js/bootstrap.min.js')}}lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="{{ asset('lib/swiper/swiper-bundle.min.js')}}"></script>
    <script src="{{ asset('js/style.js')}}"></script>

    <script src=" {{asset('js/jquery-3.5.0.min.js')}} "></script>
    <script src=" {{asset('js/plugins.js')}} "></script>
    <script src="{{ asset('js/modernizr.js') }}"></script>

</body>

</html>