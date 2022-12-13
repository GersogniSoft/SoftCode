<?php

namespace App\Providers;

use App\Http\Controllers\Front\PostController;
use Illuminate\Support\ServiceProvider;
use App\Http\ViewComposers\HomeComposer;
use Illuminate\Support\Facades\{ Blade, View, Route };


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */

    public function boot()
    {
        setlocale(LC_TIME, config('app.locale'));

        View::composer(['front.layout', 'front.index', 'front.categories'], HomeComposer::class);
        View::composer('back.layout', function ($view) {
            $title = config('titles.' . Route::currentRouteName());
            $view->with(compact('title'));
        });
    }
}
