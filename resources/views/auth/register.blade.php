@extends('front.layout')

@section('main')

<div class="blog_left_sidebar">
                        
    <section class="order" id="order">
        <div class="formContainer">
        
            <div class="formSelection">
                <!-- Validation Errors -->
                <x-auth.validation-errors :errors="$errors" />

                <h1 class="">@lang('Inscription')</h1>

                <form class="h-add-bottom" method="POST" action="{{ route('register') }}" enctype="multipart/form-data">
                @csrf
                
                <div class="inputBox">
                    <div class="inputBo input">
                        <span>@lang('Your name')</span>
                        <input id="name" type="text" name="name" placeholder="@lang('Your name')" :value="old('name')" required autofocus autocomplete="name">
                    </div>

                     <!-- Email Address -->
                    <x-auth.input-email />

                    <!-- Password -->
                    <x-auth.input-password />

                    
                    <div class="inputBo input">
                        <span>@lang('Confirm Password')</span>
                        <input id="password_confirmation" class="h-full-width" type="password" name="password_confirmation" placeholder="@lang('Confirm your Password')" required autocomplete="new-password">
                    </div>
                    
                    <div class="btnRow">
                         <input type="submit" class="btnn inscription"  value="@lang('Register')">
                    </div>
                    
                    <div class="btnRow">
                        <a href="{{ route('login') }}" class="btnn login">@lang('login')</a>
                    </div>
                    
                    </div> 
                </form>

            </div>

        </div>
        
            
        </section>

</div>

@endsection

