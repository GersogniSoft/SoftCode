@extends('front.layout')

@section('main')

<!-- post
================================================== -->
<div class="blog_left_sidebar" style="">
                        
    <div class="image">
        <img src="{{ getImage($post) }}" alt="">
    </div>
    
    <section class="review" id="review">
        <h3 class="titre">
            @foreach ($post->categories as $category)
                <a href="{{ route('category', $category->slug) }}">{{ $category->title }}</a>
            @endforeach 
            {{ $post->title }} 
        </h3>
        <p class="infoPost" style="text-align: justify;">
            {!! $post->excerpt !!}
        </p>
        @foreach ($post->fichiers as $fichier)
        <p class="telech">
            Téléchargé le projet complet
            <a href="{{url('/download', $fichier->image)}} ">ici</a>
        </p>
        @endforeach 

        <br><br><br>
        <div class="corps laravel" >

            <aside class="categories">

                <p class="infoPost" style="text-align: justify;">
                    {!! $post->body !!}
                </p>
                

            </aside>

        <br><br><br><br>
        
        <section class="comment" id="comment">
            <div class=" comment-slide">
                <div class="wrapper">
                    <div class="comment-slide">
                        <div class="user">
                            <div class="user-info">
                                <h3>
                                    <a href="{{ route('author', $post->user->id) }}">@lang('Posted By') <strong style="color: blue">{{ $post->user->name }}</strong></a>
                                    <span>@lang('On') {{ formatDate($post->created_at) }}</span>  
                                    <span class="tag">
                                        <i class='title'>@lang('Tags:')</i>
                                
                                        @foreach($post->tags as $tag)
                                            <a href="{{ route('tag', $tag->slug) }}">{{ $tag->tag }}</a>
                                        @endforeach
                                    </span>
                                </h3>
                                
                                   
                                
                            </div>
                        </div>  
                        
                    </div>
                </div>
            </div>
        </section>
        
        <div id="share">
            <div class="col-lg-4 col-md-6 footer-contact">
                
                <h4>Partager</h4>
                <div class="social-links">
                    @foreach ($contents = Share::page('https://www.youtube.com/watch?v=0OZAxdLwzdI&t=72s',$post->excerpt)
                        ->facebook()
                        ->twitter()
                        ->whatsapp()->getRawLinks() as $key => $value)

                        <a href="{{$value}} " class="{{$key}} "><i class="fa fa-{{$key}} "></i></a>
                       
                    @endforeach
                </div>
    
            </div>
        </div>

       

        </div>
    
    </section>

</div><br><br><br><br><br><hr>


<!-- comments
================================================== -->
<div class="comments-wrap">

    <div id="comments" class="row">
        <h3 style="text-align: center">
            {{$nbrcmnt}}  @lang('Comments')  
        </h3>   
        @if(Auth::guest())
            <p class="text-center">Vous devez vous <a href="{{route('login')}} ">Connecter</a>pour laisser un commentaire</p>
        @endif

        <div id="commentsList" class="column large-12">   
            
            @if($post->valid_comments_count > 0)
                <div id="forShow">
                    <p id="showbutton" class="text-center">
                        <a id="showcomments" href="{{ route('posts.comments', $post->id) }}"
                             class="btn btn-default">@lang('Show comments')
                        </a>
                    </p>
                    <p id="showicon" class="h-text-center" hidden>
                        <span class="fa fa-spinner fa-pulse fa-3x fa-fw"></span>
                    </p><br><br>
                </div>
            @endif
  
        </div>
    </div>
  
    @if(Auth::check())

    
    <section class="commentaire row comment-respond">
        <div class="wrapper column" id="respond">
          
            <div class="forme">
                <div class="comment-info">
                    <div class="form-group">
                        <h3 class="text-center">@lang('Laissé un commentaire')</h3>
                        
                        <span style="margin-left:80px" id="forName"></span>
                        <span ><a  class="text-center" id="abort" hidden href="#">@lang('Abort reply')</a></span>
                    </div>
                    
                    <div id="alert" class="alert-box" style="display: none">
                        <p></p>
                        <span class="alert-box__close"></span>
                    </div> 

                    <form id="messageForm" method="post" action="{{ route('posts.comments.store', $post->id) }}" autocomplete="off">
                        <input id="commentId" name="commentId" type="hidden" value="">
        
                        <div class="inputBox">
                            <div class="message input">
                                <textarea name="message" id="message" cols="100" rows="40" style="border: 1px solid #ccc;"
                                placeholder="@lang('Your Message')"></textarea>
                            </div>
                        </div>
                        

                        <p id="forSubmit">
                            <input name="submit" class="btn btn-info  addcomment" id="submit"  type="submit" 
                            value="@lang('Add Comment')" class="btn" style="background: blue;
                            color: #fff;border-radius:5px">
                        </p>
                        <p id="commentIcon" class="h-text-center" hidden>
                            <span class="fa fa-spinner fa-pulse fa-3x fa-fw"></span>
                        </p>
                        
                    </form>
                </div>
            </div>    
       
        </div>
    </section>


    @endif

    
  
  </div>

@endsection

@section('js')

    @include('back.shared.editorScript')

@endsection

@section('scripts')

<script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=6329da46fd193a0013760577&product=powr-social-feed' async='async'></script>
<script>
        (() => {

            // Variables
            const headers = {
                'X-CSRF-TOKEN': '{{ csrf_token() }}', 
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
            const commentId = document.getElementById('commentId');
            const alert = document.getElementById('alert');
            const message = document.getElementById('message');
            const forName = document.getElementById('forName');
            const abort = document.getElementById('abort');
            const commentIcon = document.getElementById('commentIcon');
            const forSubmit = document.getElementById('forSubmit');

            // Add comment
            const addComment = async e => {
                e.preventDefault();

                // Get datas
                const datas = {
                    message: message.value
                };

                if(document.querySelector('#commentId').value != '') {
                    datas['commentId'] = commentId.value;
                } 

                // Icon
                commentIcon.hidden = false;
                forSubmit.hidden = true;

                // Send request
                const response = await fetch('{{ route('posts.comments.store', $post->id) }}', { 
                    method: 'POST',
                    headers: headers,
                    body: JSON.stringify(datas)
                });

                // Wait for response
                const data = await response.json();

                // Icon
                commentIcon.hidden = true;
                forSubmit.hidden = false;

                // Manage response
                if (response.ok) {
                    purge();                  
                    if(data == 'ok') {
                        showComments();
                        showAlert('success', '@lang('Your comment has been saved')');
                    } else {
                        showAlert('info', "@lang('Thanks for your comment. It will appear when an administrator has validated it. Once you are validated your other comments immediately appear.')");
                    }
                } else {
                    if(response.status == 422) {
                        showAlert('error', data.errors.message[0]);
                    } else {                
                        errorAlert();
                    }                
                }       
            }

            const errorAlert = () =>  Swal.fire({
                                        icon: 'error',
                                        title: '@lang('Whoops!')',
                                        text: '@lang('Something went wrong!')'
                                    });          

            // Show alert
            const showAlert = (type, text) => {
                alert.style.display = 'block';
                alert.className = '';
                alert.classList.add('alert-box', 'alert-box--' + type);
                alert.firstChild.textContent = text;
            }

            // Hide alert
            const hideAlert = () => alert.style.display = 'none';

            // Prepare show comments
            const prepareShowComments = e => {
                e.preventDefault();

                document.getElementById('showbutton').toggleAttribute('hidden');
                document.getElementById('showicon').toggleAttribute('hidden');
                showComments(); 
            }

            // Show comments
            const showComments = async () => {

                // Send request
                const response = await fetch('{{ route('posts.comments', $post->id) }}', { 
                    method: 'GET',
                    headers: headers
                });

                // Wait for response
                const data = await response.json();

                document.getElementById('commentsList').innerHTML = data.html;
                @if(Auth::check())
                    document.getElementById('respond').hidden = false;
                @endif
            }

            // Reply to comment
            const replyToComment = e => {              
                e.preventDefault();

                forName.textContent = `@lang('Reply to') ${e.target.dataset.name}`;
                commentId.value = e.target.dataset.id;
                abort.hidden = false;
                message.focus();
            }

            // Abort reply
            const abortReply = (e) => {
                e.preventDefault();
                purge();       
            }

            // Purge reply
            const purge = () => {
                forName.textContent = '';
                commentId.value = '';                
                message.value = '';
                abort.hidden = true; 
            }

            // Delete comment
            const deleteComment = async e => {              
                e.preventDefault();

                Swal.fire({
                title: '@lang('Really delete this comment?')',
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "@lang('Yes')",
                cancelButtonText: "@lang('No')",
                preConfirm: () => {
                    return fetch(e.target.getAttribute('href'), { 
                        method: 'DELETE',
                        headers: headers
                    })
                    .then(response => {
                        if (response.ok) {
                            showComments();
                        } else {
                            errorAlert();
                        }
                    });
                }
                });
            }

            // Listener wrapper
            const wrapper = (selector, type, callback, condition = 'true', capture = false) => {
                const element = document.querySelector(selector);
                if(element) {
                    document.querySelector(selector).addEventListener(type, e => { 
                        if(eval(condition)) {
                            callback(e);
                        }
                    }, capture);
                }
            };

            // Set listeners
            window.addEventListener('DOMContentLoaded', () => {
                wrapper('#showcomments', 'click', prepareShowComments);              
                wrapper('#abort', 'click', abortReply);
                wrapper('#message', 'focus', hideAlert);
                wrapper('#messageForm', 'submit', addComment);
                wrapper('#commentsList', 'click', replyToComment, "e.target.matches('.replycomment')");
                wrapper('#commentsList', 'click', deleteComment, "e.target.matches('.deletecomment')");
            })

        })()

    </script> 
@endsection