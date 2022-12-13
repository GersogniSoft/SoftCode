@extends('front.layout')

@section('main')

<div class="blog_left_sidebar">
                        
    <section class="order" id="order">
        <div class="formContaine">
        
            <div class="formSelection">
                <!-- Validation Errors -->
                <x-auth.validation-errors :errors="$errors" />
                <!-- Session Status -->
                <x-auth.session-status :status="session('status')" />

                <h2 class="text-center">@lang('Get In Touch With Us')</h2><br>

                <form class="s-content__form" method="post" action="{{ route('contacts.store') }}">
                    @csrf
                    

                    <div class="inputBox">
                        
                        <input id="commentId" name="commentId" type="hidden" value="">
                            @if(Auth::guest())
                                <!-- Name -->
                                <div class="inputBo input">
                                    <span>@lang('Your name')</span>
                                    <input 
                                    id="name" 
                                    class="h-full-width" 
                                    type="text" 
                                    name="name" 
                                    placeholder="@lang('Your name')" 
                                    value="{{ old('name') }}" 
                                    required 
                                    autofocus>
                                </div>
                                
                                <!-- Email Address -->
                                <x-auth.input-email />

                            @endif

                            <!-- Name -->
                            <div class="inputBo input">
                                <span>@lang('Your message')</span>
                                <textarea name="message" id="message" class="form-control" rows="10" style="border: 1px solid #ccc;"
                                placeholder="@lang('Your Message')" required>{{ old('message') }}</textarea>
                            </div>

                        <div class="btnRow">
                            <input name="submit" id="submit" type="submit" class="btnn inscription addcomment" value="@lang('Envoyer')">
                        </div>
                        
                        
                        </div> 
                </form>

            </div>

        </div>
               
    </section>

</div>

@endsection

