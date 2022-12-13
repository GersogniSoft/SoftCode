<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | User Profile</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="{{ Auth::user()->profile_photo_path === NULL ? Gravatar::get(Auth::user()->email) : asset('storage')}}/{{Auth::user()->profile_photo_path}}"  class="brand-image img-circle" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="" class="d-block">{{auth()->user()->name}}</a>
                    </div>
                </div>



                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                      
                        <li class="nav-item">
                            <a href="" class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    @lang('Dashboard')
                                </p>
                            </a> 
                        </li>

                        <li class="nav-item">
                            <a href="{{route('home')}} " class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    @lang('Revenir au site')
                                </p>
                            </a> 
                        </li>

                    </ul>
                </nav>
            
            </div>
         
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Profile</h1>
                        </div>
                        
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <form class="form-horizontal" method="POST" action="{{ route('profile') }}" enctype="multipart/form-data">
                @csrf
                @method('PUT')

             <!-- Main content -->
             <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3">

                            <!-- Profile Image -->
                            <div class="card card-primary card-outline">
                                <div class="card-body box-profile">
                                    <div class="text-center">
                                        <img class="profile-user-img img-fluid img-circle" src="{{ Auth::user()->profile_photo_path === NULL ? Gravatar::get(Auth::user()->email) : asset('storage')}}/{{Auth::user()->profile_photo_path}}" alt="User profile picture">
                                    </div>

                                    <h3 class="profile-username text-center">{{auth()->user()->name}}</h3>

                                    <p class="text-muted text-center">@lang('User')</p>
                                    

                                    <div class="form-group{{ $errors->has('image') ? ' is-invalid' : '' }}">
                                       
                                        <div id="wrapper">
                                         
                                            <div class="custom-file">
                                              <input type="file" id="image" name="image"
                                                    class="{{ $errors->has('image') ? ' is-invalid ' : '' }}custom-file-input">
                                                
                                              <label class="custom-file-label" for="image"></label>
                                              @if ($errors->has('image'))
                                                <div class="invalid-feedback">
                                               
                                                </div>
                                              @endif
                                            </div> 
                                   
                                        </div>
                                      </div>
                                   
                                </div>
                                <!-- /.card-body -->
                            </div>

                        </div>
                       

                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-header p-2">
                                    <ul class="nav nav-pills">

                                        <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">Comments</a></li>
                                        <li class="nav-item"><a class="nav-link active" href="#settings" data-toggle="tab">Settings</a></li>
                                    </ul>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="tab-content">


                                        <!-- /.tab-pane -->
                                        <div class="tab-pane" id="timeline">
                                            <!-- The timeline -->
                                            <div class="timeline timeline-inverse">
                                                <!-- timeline time label -->
                                                <div class="time-label">
                                                    <span class="bg-danger">
                                                        10 Feb. 2014
                                                    </span>
                                                </div>


                                                <div>
                                                    <i class="fas fa-comments bg-warning"></i>

                                                    <div class="timeline-item">
                                                        <span class="time"><i class="far fa-clock"></i> 27 mins ago</span>

                                                        <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                                                        <div class="timeline-body">
                                                            Take me to your leader! Switzerland is small and neutral! We are more like Germany, ambitious and misunderstood!
                                                        </div>
                                                        <div class="timeline-footer">
                                                            <a href="#" class="btn btn-warning btn-flat btn-sm">View comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.tab-pane -->

                                        <div class="active tab-pane" id="settings">
                                             
                                            

                                                <x-back.validation-errors :errors="$errors" />

                                                    @if(session('ok'))
                                                        <x-back.alert 
                                                            type='success'
                                                            title="{!! session('ok') !!}">
                                                        </x-back.alert>
                                                    @endif

                                                <div class="form-group row">
                                                    <label for="inputName" class="col-sm-2 col-form-label">@lang('Name')</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            type="text" 
                                                            class="form-control"
                                                            id="name" 
                                                            name="name"
                                                            placeholder="Name"
                                                            value="{{ old('name', auth()->user()->name) }}"
                                                            required 
                                                            autofocus >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="inputEmail" class="col-sm-2 col-form-label">@lang('Email')</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            type="email"
                                                            class="form-control"
                                                            id="email"
                                                            name="email"
                                                            placeholder="email"
                                                            value="{{ old('email', auth()->user()->email) }}" 
                                                            required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="inputName2" class="col-sm-2 col-form-label">@lang('Password')</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            type="password" 
                                                            class="form-control" 
                                                            id="password"
                                                            name="password" 
                                                            placeholder="@lang('Your Password if you want to change it')">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="inputName2" class="col-sm-2 col-form-label">@lang('Confirm Password')</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            type="password" 
                                                            class="form-control" 
                                                            id="password_confirmation"
                                                            name="password_confirmation" 
                                                            placeholder="@lang('Confirmer votre mot de passe')">
                                                    </div>
                                                </div>



                                                
                                                <div class="form-group row">
                                                    <div class="offset-sm-2 col-sm-10">
                                                        <button type="submit" class="btn btn-info">Submit</button>
                                                    </div>
                                                </div>

                                          

                                        </div>
                                        <!-- /.tab-pane -->
                                    </div>
                                    <!-- /.tab-content -->
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->

        </form>

        </div>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    @section('js')
  <script>
    $(document).ready(() => {
      $('form').on('change', '#profile_photo_path', e => {
        $(e.currentTarget).next('.custom-file-label').text(e.target.files[0].name);
      });
      $('#changeImage').click(e => {
        $(e.currentTarget).parent().hide();
        $('#wrapper').html(`
          <div id="profile_photo_path" class="custom-file">
            <input type="file" id="profile_photo_path" name="profile_photo_path" class="custom-file-input">
            <label class="custom-file-label" for="profile_photo_path"></label>
          </div>`
        );
      });
    });
  </script>
@endsection

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
</body>

</html>

