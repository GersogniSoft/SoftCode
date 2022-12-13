@extends('back.layout')

@section('css')
    <style>
        #holder img {
            height: 100%;
            width: 100%;
        }
    </style>
@endsection

@section('main')

    <form enctype="multipart/form-data"
        method="post" 
        action="{{ Route::currentRouteName() === 'fichiers.edit' ? route('fichiers.update', $fichiers->id) : route('fichiers.store') }}">

        @if(Route::currentRouteName() === 'fichiers.edit')
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
                        title='Title'
                        name='title'
                        :value="isset($document) ? $document->title : ''"
                        input='text'
                        :required="true">
                    </x-back.input>
                    
                    <x-back.input
                        title='Slug'
                        name='slug'
                        :value="isset($document) ? $document->slug : ''"
                        input='text'
                        :required="true">
                    </x-back.input>
                  
                </x-back.card>


                <x-back.card
                    type='primary'
                    :outline="false"
                    title='ZIP FILE'>

                    <div class="form-group{{ $errors->has('image') ? ' is-invalid' : '' }}">
                        <label for="description">Image</label>
                        @if(isset($document) && !$errors->has('image'))
                          <div>
                            <p><img src="{{ asset('images/' . $document->image) }}"></p>
                            <button id="changeImage" class="btn btn-warning">Changer d'image</button>
                          </div>
                        @endif
                        <div id="wrapper">
                          @if(!isset($category) || $errors->has('image'))
                            <div class="custom-file">
                              <input type="file" id="image" name="image"
                                    class="{{ $errors->has('image') ? ' is-invalid ' : '' }}custom-file-input" required>
                              <label class="custom-file-label" for="image"></label>
                              @if ($errors->has('image'))
                                <div class="invalid-feedback">
                                  {{ $errors->first('image') }}
                                </div>
                              @endif
                            </div> 
                          @endif
                        </div>
                      </div>

                </x-back.card>


                <button type="submit" class="btn btn-primary">@lang('Submit')</button>

              </div>
        </div>


    </form>

@endsection

@section('js')

    <script src="https://cdnjs.cloudflare.com/ajax/libs/speakingurl/14.0.1/speakingurl.min.js"></script>
    <script>

        $(function() 
        {
            $('#slug').keyup(function () {
              $(this).val(getSlug($(this).val()))
            })

            $('#title').keyup(function () {
              $('#slug').val(getSlug($(this).val()))
            })
        });

    </script>

    <script>
        $(document).ready(() => {
        $('form').on('change', '#image', e => {
            $(e.currentTarget).next('.custom-file-label').text(e.target.files[0].name);
        });
        $('#changeImage').click(e => {
            $(e.currentTarget).parent().hide();
            $('#wrapper').html(`
            <div id="image" class="custom-file">
                <input type="file" id="image" name="image" class="custom-file-input" required>
                <label class="custom-file-label" for="image"></label>
            </div>`
            );
        });
        });
    </script>
 
@endsection

