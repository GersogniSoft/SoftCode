@extends('back.layout')

@section('main')

    <form 
        method="post" 
        action="{{ Route::currentRouteName() === 'softcodes.edit' ? route('softcodes.update', $softcode->id) : route('softcodes.store') }}">

        @if(Route::currentRouteName() === 'softcodes.edit')
            @method('PUT')
        @endif
        
        @csrf

        <div class="row">
          <div class="col-md-12">
                
                <x-back.validation-errors :errors="$errors" />

                @if(session('ok'))
                    <x-back.alert 
                        type='success'
                        title="{!! session('ok') !!}">
                    </x-back.alert>
                @endif

                <x-back.card
                    type='info'
                    :outline="true"
                    title=''>
                    <x-back.input
                        title='Name'
                        name='name'
                        :value="isset($softcode) ? $softcode->name : ''"
                        input='text'
                        :required="true">
                    </x-back.input>
                    <x-back.input
                        title='Email'
                        name='email'
                        :value="isset($softcode) ? $softcode->email : ''"
                        input='email'
                        :required="true">
                    </x-back.input>
                    <x-back.input
                        title='Address'
                        name='address'
                        :value="isset($softcode) ? $softcode->address : ''"
                        input='text'
                        :required="true">
                    </x-back.input>
                  
                </x-back.card>

                <x-back.card
                    type='primary'
                    title='Home Info'>
                    <x-back.input
                        name='homeinfos'
                        :value="isset($softcode) ? $softcode->home_infos : ''"
                        input='textarea'
                        :required="true">
                    </x-back.input>
                </x-back.card>

                <x-back.card
                    type='primary'
                    title='Home Info'>
                    <x-back.input
                        name='homeinfossub'
                        :value="isset($softcode) ? $softcode->home_infos_sub : ''"
                        input='textarea'
                        :required="true">
                    </x-back.input>
                </x-back.card>
                <button type="submit" class="btn btn-primary">@lang('Submit')</button>

              </div>
        </div>


    </form>

@endsection


