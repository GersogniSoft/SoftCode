@props(['email' => ''])

<div class="inputBo input">
    <span>@lang('Your Email')</span>
    <input 
        id="email" 
        type="email" 
        name="email"
        placeholder="@lang('Enter your name')"
        :value="{{ old('email', $email) }}" 
        required 
        autofocus>
</div>