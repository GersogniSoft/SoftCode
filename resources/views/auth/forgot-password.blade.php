@extends('front.layout')

@section('main')

<div class="blog_left_sidebar">
                        
    <section class="order" id="order">
        <div class="formContainer">
        
            <div class="formSelection">
                <div class="mb-4 text-sm" style="color:gray">
                    {{ __('Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.') }}
                </div>
                <!-- Validation Errors -->
                <x-auth.validation-errors :errors="$errors" />
                <!-- Session Status -->
                <x-auth.session-status :status="session('status')" />

                <form class="h-add-bottom" method="POST" action="{{ route('password.email') }}">
                    @csrf   

                    <div class="inputBox">
                    
                        <!-- Email Address -->
                        <x-auth.input-email />

                        <div class="btnRow">
                            <x-auth.submit title="Email Password Reset Link" />
                        </div>
                        
                    </div> 
                </form>

            </div>
        </div> 

    </section>

</div>

@endsection

