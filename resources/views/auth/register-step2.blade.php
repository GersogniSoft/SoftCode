@extends('front.layout')

@section('main')

<div class="blog_left_sidebar">
                        
    <section class="order" id="order">
        <div class="formContainer">
        
            <div class="formSelection">
                <!-- Validation Errors -->
                <x-auth.validation-errors :errors="$errors" />

                <h1 class="">@lang('Finalisé Inscription')</h1>

                <form class="h-add-bottom" method="POST" action="{{ route('register-step2.post') }}">
                @csrf
                
                    <div class="inputBox">
                        <div class="inputBo input">
                            <span>@lang('Your phone')</span>
                            <input id="phone" type="text" name="phone" placeholder="@lang('Your name')" :value="old('name')" required autofocus autocomplete="name">
                        </div>

                        <div class="btnRow">
                            <input type="submit" class="btnn inscription"  value="@lang('Finalise Register')">
                        </div>
            
                    </div> 
                </form>

            </div>

        </div>
        
            
        </section>

</div>

@endsection

