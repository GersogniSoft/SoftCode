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

                <h1 class="">@lang('Renouvellement du mot de passe')</h1>

                <form class="h-add-bottom" method="POST" action="{{ route('password.update') }}">
                @csrf   

                    <div class="inputBox">
                        
                        <!-- Password Reset Token -->
                        <input type="hidden" name="token" value="{{ $request->route('token') }}">
                        <!-- Email Address -->
                        <x-auth.input-email :email="$request->email" />

                        <!-- Password -->
                        <x-auth.input-password />

                        <div class="inputBo input">
                            <span>@lang('Confirm Password')</span>
                            <input id="password_confirmation" class="h-full-width" type="password" name="password_confirmation" placeholder="@lang('Confirm your Password')" required autocomplete="new-password">
                        </div>

                            <div class="btnRow">
                                <x-auth.submit title="Login" />
                            </div>
                            
                        </div> 
                    </form>

                </div>

        </div>
               
    </section>

</div>

@endsection



