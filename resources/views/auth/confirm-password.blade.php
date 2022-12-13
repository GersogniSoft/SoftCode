
@extends('front.layout')

@section('main')

<div class="blog_left_sidebar">
                        
    <section class="order" id="order">
        <div class="formContainer">
        
            <div class="formSelection">

                <div class="mb-4 text-sm text-gray-600">
                    {{ __('This is a secure area of the application. Please confirm your password before continuing.') }}
                </div>
                <!-- Validation Errors -->
                <x-auth.validation-errors :errors="$errors" />

                <form method="POST" action="{{ route('password.confirm') }}">
                    @csrf

                    <div class="inputBox">
                        
                        <div class="inputBo input">
                            <span>@lang('Password')</span>
                            <input id="password" class="block mt-1 w-full"
                                type="password"
                                name="password"
                                required autocomplete="current-password" >
                        </div>

                            <div class="btnRow">
                                <x-auth.submit title="Confirm" />
                            </div>
                            
                        </div> 
                    </form>

                </div>

        </div>
               
    </section>

</div>

@endsection




