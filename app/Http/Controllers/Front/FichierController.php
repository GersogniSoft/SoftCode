<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use BaconQrCode\Renderer\Path\Path;

class FichierController extends Controller
{
    public function download($fichier)
    {
        
        return  response()->download(public_path('storage/files/'.$fichier));
        return  back()->with('ok', __('file downloaded'));
    }
}
