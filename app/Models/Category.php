<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [ 
        'title', 
        'slug',
        'info',
        'image',
    ];

    public $timestamps = false;

    public function posts()
    {
        return $this->belongsToMany(Post::class);
    }

     /**
     * Many to Many relation
     *
     * @return \Illuminate\Database\Eloquent\Relations\belongsToMany
     */
    public function gersos()
    {
        return $this->belongsToMany(Gerso::class);
    }
}
