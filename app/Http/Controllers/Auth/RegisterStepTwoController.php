<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class RegisterStepTwoController extends Controller
{
    public function create()
    {
        return view(view:'auth.register-step2');
    }

    public function store(Request $request )
    {
        Auth::user()->update([
            'phone' => $request->phone,
        ]);
        return redirect()->route(route:'home');
    }
}
