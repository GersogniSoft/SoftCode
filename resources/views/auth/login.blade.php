@extends('front.layout')

@section('main')

<div class="blog_left_sidebar">
                        
    <section class="order" id="order">
        <div class="formContainer">
        
            <div class="formSelection">
                <!-- Validation Errors -->
                <x-auth.validation-errors :errors="$errors" />
                <!-- Session Status -->
                <x-auth.session-status :status="session('status')" />

                <h1 class="">@lang('Login')</h1>

                <form class="h-add-bottom" method="POST" action="{{ route('login') }}">
                @csrf   

                    <div class="inputBox">
                        

                                <!-- Email Address -->
                        <x-auth.input-email />

                        <!-- Password -->
                        <x-auth.input-password />

                        <div class=" row">
                            <div class="col">
                            <input id="remember_me" 
                                    type="checkbox" 
                                    name="remember" 
                                    {{ old('remember_me') ? 'checked' : '' }} >
                            <label for="remember_me">@lang('Remember me')</label>
                            </div>
                            <a href="{{ route('password.request') }}" id="forgetpasswd">@lang('Forgot Your Password?')</a>
                        </div>
                        <div class="btnRow">
                            <x-auth.submit title="Login" />
                        </div>
                        <div class="btnRow">
                            <a href="{{ route('register') }}" class="btnn inscription">@lang('Inscription')</a>
                        </div>
                        <h4>Or login with</h4>
                        <div class="btnRow ">
                            <a href="{{url("auth/google")}}" class="btnn btnGroup">
                                <img src="images/icons8-google-48.png" alt="">
                                google
                            </a>
                        </div>
                        
                        </div> 
                    </form>

                </div>

        </div>
               
    </section>

</div>

@endsection


