<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Softcode extends Model
{
    use HasFactory;

     
    protected $fillable = [
        'name', 'email', 'address', 'home_infos', 'home_infos_sub'
    ];
    public $timestamps = false;
}
