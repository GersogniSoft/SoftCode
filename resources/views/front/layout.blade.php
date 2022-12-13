<!DOCTYPE html>
<html class="no-js" lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>{{ isset($post) && $post->seo_title ? $post->seo_title :  config('app.name') }}</title>
    <meta name="description" content="{{ isset($post) && $post->meta_description ? $post->meta_description : __(config('app.description')) }}">
    <meta name="author" content="{{ isset($post) ? $post->user->name : __(config('app.author')) }}">
    @if(isset($post) && $post->meta_keywords)
        <meta name="keywords" content="{{ $post->meta_keywords }}">
    @endif

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Vendor CSS Files -->
 
  <link rel="stylesheet" href="{{asset('assets/bootstrap/css/bootstrap.min.css')}} ">
  <link href="{{asset('assets/vendor/icofont/icofont.min.css')}} " rel="stylesheet">
  <link href="{{asset('assets/vendor/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/ionicons/css/ionicons.min.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/animate.css/animate.min.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/venobox/venobox.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/owl.carousel/assets/owl.carousel.min.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/aos/aos.css')}}" rel="stylesheet">

  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS
    ================================================== -->
    <link href="{{asset('assets/css/utile.css')}} " rel="stylesheet">
    @yield('style')

    <!-- script
    ================================================== -->
    <script src="{{ asset('js/modernizr.js') }}"></script>
   

    <!-- favicons
    ================================================== -->
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('apple-touch-icon.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('favicon-16x16.png') }}">
    <link rel="manifest" href="{{ asset('site.webmanifest') }}">

</head>

<body class="light">

    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
        @csrf
    </form>
           <!-- HEADER -->
  <header>
        
    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="flex_bar">
          
            <div class="header-logo">
                <a href="{{ route('home') }}" class="logo">
                    <img src="{{asset('images/logo3.png')}}" alt="" srcset="" style="width:110px;height:40px">
                   
                </a> 
            </div>
              
          
            <div class="nav-menu">
                <nav class="nav-menu d-none d-lg-block responsive-nav ">
                    <ul>
                        <li class="active"><a href="{{ route('home') }}">@lang('Home')</a></li>
                        
                        <li class="drop-down"><a href="">@lang('Categories')</a>
                            <ul>
                                @foreach($categories as $category)
                                    <li>
                                        <a href="{{ route('category', $category->slug) }}">
                                            {{ $category->title }}
                                        </a>
                                     </li>
                                @endforeach     
                            </ul>
                        </li>

                        
                        <li {{ currentRoute('contacts.create') }}>
                            <a href="{{ route('contacts.create') }}" title="">@lang('Contact')</a>
                        </li>

                        <li class="drop-down"><a href="">@lang('Règle')</a>
                            <ul>
                                @foreach($pages as $page)
                                    <li>
                                        <a href="{{ route('page', $page->slug) }}">
                                        @lang( $page->title) 
                                        </a>
                                    </li>
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
                        <i class="button-toggle fa fa-moon-o" id="search-icon"></i>
                        @guest
                         
                            <a href="{{ route('login') }}" class="login">@lang('login')</a>
                        @else

                            @if(auth()->user()->role != 'user')
                                <a href="{{ url('admin') }}">@lang('Admin')</a>
                            @endif
                    
                            <a href="{{ route('profile.show') }}" class="gersog">
                            <img src="{{ Auth::user()->profile_photo_path === NULL ? Gravatar::get(Auth::user()->email) : asset('storage')}}/{{Auth::user()->profile_photo_path}}" alt="" srcset=""></a>
                        @endguest 

                    </div>
                    
                </div>

                <div class="icons menu-toggle">
                    <a href="#">
                        <i class="fa fa-bars navbar-show-btn navbar__right " id="menu-bars"></i>
                    </a>
                </div>
                 
            </div>
               
        </div>
      
    </div>
 
</header>

<div class="navbar-collapse ">

    <button type="button" class="navbar-hide-btn">
        <i class="fa fa-times "></i>
    </button>

    <ul class="nav-links">
        <li class="nav-item">
            <a href="" class="nav-link">
               <span class="Link_name">@lang('Home') </span>
            </a>
        </li>
        <li>
            <div class="icons_link">
                <a href="" class="nav-link">
                <span class="Link_name">@lang('Categories')</span>
                </a>
                <i class="fa fa-chevron-down arrow"></i>
            </div>
            <ul class="sub-item">
                @foreach($categories as $category)
                    <li>
                        <a href="{{ route('category', $category->slug) }}">
                            @lang($category->title) 
                        </a>
                    </li>
                @endforeach  
            </ul>
            
        </li>

        <li>
            <div class="icons_link">
                <a href="" class="nav-link">
                <span class="Link_name">@lang('Pages')</span>
                </a>
                <i class="fa fa-chevron-down arrow"></i>
            </div>
            <ul class="sub-item">
                @foreach($pages as $page)
                    <li>
                        <a href="{{ route('page', $page->slug) }}">
                           @lang( $page->title) 
                        </a>
                    </li>
                @endforeach  
            </ul>
            
        </li>
        <li {{ currentRoute('contacts.create') }}>
            <div class="icons_link">
                <a href="{{ route('contacts.create') }}" class="nav-link">
                <span class="Link_name">@lang('Contact')</span>
                </a>
                
            </div> 
        </li><br>
        @guest
        @else
        <li class="nav-item">
            <div class="icons_link">
                <a href="{{route('profile.show')}}" class="nav-link">
                    <span class="Link_name">@lang('Profile') </span>
                </a>
                
            </div> 
        </li><br>

        <li class="nav-item">
            <div class="icons_link">
                <a class="nav-link" href="{{ route('logout') }}"  onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();">
                    <span class="Link_name">@lang('logout') </span>
                </a>
                
            </div> 
        </li>
        
        @endguest
    
    </ul>

</div>
<!-- /HEADER -->

<form role="search" method="get" action="{{ Route('posts.search') }}" id="search-form">
    <input type="search" name="search" placeholder="@lang('Search here:')" id="search" placeholder="@lang('Search for...')" title="@lang('Search for:')" autocomplete="off">
    <label for="search-box" class="fa fa-search"></label>
    <i class="fa fa-times" id="close"></i>
</form>


  <!-- ======= Intro HERO ======= -->

        @yield('hero')

   <!-- ======= Intro HERO ======= -->
 
 

  <!-- content
    ================================================== -->
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
                                <!-- ShareThis BEGIN --><div class="sharethis-inline-follow-buttons"></div><!-- ShareThis END -->
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
                                            <p> {{formatDate($post->created_at)}} à {{formatHour($post->created_at)}} </p>
                                        </div>
                                    </div>

                                @endforeach
                                
                            </aside>

                        <aside class="categories">
                            <h4>META</h4>
                            <ul>
                                <li>
                                    <a href="{{route('register')}} " class="">
                                        <p>Inscription</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="{{route('login')}} ">
                                        <p>Connexion</p>
                                    </a>
                                </li> 
                            </ul>
                        </aside>
                        
                        <aside class="categories">
                            <h4>M'offrire un café</h4>
                            <ul>
                                <li>
                                    <form action="" method="post">
                                        @csrf
                                        <input type="hidden" name="amount" value="1">
                                        
                                    <a href="#" class="">
                                        <p>Si vous appreciez mon travail</p>
                                    </a>
                                    <p>merci à tout les genereux donateurs</p>
                                </form>
                                </li>
                            </ul>
                        </aside>
                        <aside class="categories">
                            <ul>
                                <li>
                                    @foreach($pages as $page)
                                        <a href="{{ route('page', $page->slug) }}" class="">
                                            <p>@lang($page->title)</p>
                                        </a>
                                    @endforeach    
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

          <div class="col-lg-6 col-md-6 footer-links">
            <h4>@lang('Pages ')</h4>
            <ul>
                @foreach($pages as $page)
                    <li><i class="ion-ios-arrow-right"></i> <a href="{{ route('page', $page->slug) }}">@lang($page->title)</a></li>
                @endforeach
            </ul>
          </div>

          <div class="col-lg-6 col-md-6 footer-contact">
            <h4>@lang('Contact Us')</h4>
            <p>
                @foreach ($softcodes as $softcode)

                    <strong>@lang('Phone:')</strong> +243 816 147 57<br>
                    <strong>@lang('Email:') </strong>{{$softcode->email}}<br>
                    
                @endforeach
              
            </p>

            <div class="social-links">
                <div class="sharethis-inline-follow-buttons"></div>
            </div>

          </div>
        </div>
      </div>
    </div>

  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  
  <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=631db27d0b5e930012a9c595&product=inline-follow-buttons' async='async'></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

  <script src="{{asset('assets/vendor/jquery/jquery.min.js')}}"></script>
  <script src="{{asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  <script src="{{asset('assets/vendor/jquery.easing/jquery.easing.min.js')}}"></script>
  <script src="{{asset('assets/vendor/waypoints/jquery.waypoints.min.js')}}"></script>
  <script src="{{asset('assets/vendor/isotope-layout/isotope.pkgd.min.js')}}"></script>
  <script src="{{asset('assets/vendor/venobox/venobox.min.js')}}"></script>
  <script src="{{asset('assets/vendor/owl.carousel/owl.carousel.min.js')}}"></script>
  <script src="{{asset('assets/vendor/aos/aos.js')}}"></script>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="{{ asset('assets/js/main.js') }}"></script>
  <script src="{{ asset('assets/js/plugins.js') }}"></script>


  <!-- Template Main JS File -->
  <script src="{{asset('assets/js/scripte.js')}}"></script>



    <!-- JavaScript
    ================================================== -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="{{ asset('js/plugins.js') }}"></script>
    <script src="{{ asset('js/main.js') }}"></script>
    
    @yield('scripts')

</body>

</html>