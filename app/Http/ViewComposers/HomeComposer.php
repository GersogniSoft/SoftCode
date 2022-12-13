<?php

namespace App\Http\ViewComposers;

use Illuminate\View\View;
use App\Models\ {Category, Gerso, Post, Page, Follow, Softcode} ;

class HomeComposer
{
    /**
     * Bind data to the view.
     *
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {
        $view->with([
            'heros' => Post::select('id','slug','image','title','created_at','excerpt','user_id')
            ->with('user:id,name', 'categories')->whereActive(true)->latest('updated_at')->take(5)->get(),    
        ]);

        $view->with([
            'categories' => Category::has('posts')->get(),
            'pages'      => Page::select('slug', 'title')->get(),
            'follows' => Follow::all(),
            'softcodes' => Softcode::all(),
        ]);
    }
}