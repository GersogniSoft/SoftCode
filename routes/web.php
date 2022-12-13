<?php

use Illuminate\Support\Facades\Route;
use UniSharp\LaravelFilemanager\Lfm;
use App\Http\Controllers\Auth\GoogleController;
use App\Http\Controllers\Auth\RegisterStepTwoController;
use App\Http\Controllers\Front\{
    PostController as FrontPostController,
    CommentController as FrontCommentController,
    ContactController as FrontContactController,
    PageController as FrontPageController,
    FichierController,
    
};



use App\Http\Controllers\Back\{ 
    AdminController,
    CategoryController as BackCategoryController,
    PostController as BackPostController,
    GersoController as BackGersoController,
    UserController as BackUserController,
    ResourceController as BackResourceController,
    FichierController as BackFichierController,
};
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::group(['prefix' => 'laravel-filemanager', 'middleware' => 'auth'], function () {
    Lfm::routes();
});


//authentification google et facebook
Route::get('auth/google', [GoogleController::class, 'RedirectToGoogle']);
Route::get('auth/google/callback', [GoogleController::class, 'hundleGoogleCallback']);

//download file
Route::get('/download/{fichier}',[FichierController::class, 'download']);



// Home
Route::name('home')->get('/', [FrontPostController::class, 'index']);
Route::name('category')->get('category/{category:slug}', [FrontPostController::class, 'category']);
Route::name('author')->get('author/{user}', [FrontPostController::class, 'user']);
Route::name('tag')->get('tag/{tag:slug}', [FrontPostController::class, 'tag']);

Route::prefix('posts')->group(function () {
    Route::name('posts.display')->get('{slug}', [FrontPostController::class, 'show']);
    Route::name('posts.search')->get('', [FrontPostController::class, 'search']);
    Route::get('{post}/comments', [FrontCommentController::class, 'comments'])->name('posts.comments');
    Route::post('{post}/comments', [FrontCommentController::class, 'store'])->middleware('auth')->name('posts.comments.store');
    Route::name('front.comments.destroy')->delete('comments/{comment}', [FrontCommentController::class, 'destroy']);
    Route::name('cours.pdf')->get('cours/pdf', [FrontPostController::class, 'pdf']);
});

Route::name('front.comments.destroy')->delete('comments/{comment}', [FrontCommentController::class, 'destroy']);
Route::resource('contacts', FrontContactController::class, ['only' => ['create', 'store']]);
Route::name('page')->get('page/{page:slug}', FrontPageController::class);




//administration
Route::prefix('admin')->group(function () {
    Route::middleware('redac')->group(function () {
        Route::name('admin')->get('/', [AdminController::class, 'index']);
        Route::name('purge')->put('purge/{model}', [AdminController::class, 'purge']);
       // Posts
       Route::resource('posts', BackPostController::class)->except(['show', 'create']);
       Route::get('posts/create/{id?}', [BackPostController::class, 'create'])->name('posts.create');
        // Users
        Route::put('valid/{user}', [BackUserController::class, 'valid'])->name('users.valid');
        Route::put('unvalid/{user}', [BackUserController::class, 'unvalid'])->name('users.unvalid');
        // Comments
        Route::resource('comments', BackResourceController::class)->except(['show', 'create', 'store']);
        Route::get('newcomments', [BackResourceController::class, 'index'])->name('comments.indexnew'); 
      
    });

    Route::middleware('admin')->group(function () {
     
        // Posts
        Route::get('newposts', [BackPostController::class, 'index'])->name('posts.indexnew');
        //categories
        Route::resource('categories', BackCategoryController::class)->except(['show']);
       
        //sous categories
        Route::resource('gersos', BackGersoController::class)->except(['show']);

        
        // Users
        Route::resource('users', BackUserController::class)->except(['show', 'create', 'store']);
        Route::get('newusers', [BackResourceController::class, 'index'])->name('users.indexnew');
        // Contacts
        Route::resource('contacts', BackResourceController::class)->only(['index', 'destroy']);
        Route::get('newcontacts', [BackResourceController::class, 'index'])->name('contacts.indexnew');
        // Pages
        Route::resource('pages', BackResourceController::class)->except(['show']);
         // softcode
         Route::resource('softcodes', BackResourceController::class)->except(['show']);
        // Follows
        Route::resource('follows', BackResourceController::class)->except(['show']);
         //files
         Route::resource('fichiers', BackFichierController::class)->except(['show']);
         
    });
  
});

Route::group(['middleware' => 'auth', 'verified'], function () {
    Route::get('register-step2', [RegisterStepTwoController::class, 'create'])->name('register-step2.create');
    Route::post('register-step2', [RegisterStepTwoController::class, 'store'])->name('register-step2.post');
});
 







Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified' ])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});
