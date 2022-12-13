<?php

namespace App\Http\Controllers\Back;

use App\Http\{
    Controllers\Controller,
    Requests\Back\GersoRequest
};
use Illuminate\Http\Request;
use App\DataTables\GersosDataTable;
use App\Repositories\PostRepository;
use App\Models\Gerso;

class GersoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(GersosDataTable $dataTable)
    {
        return $dataTable->render('back.shared.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('back.souscategories.form');
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
   
    public function store(GersoRequest $request)
    {
       
        Gerso::create($request->all());

        return back()->with('ok', __('The sub categorie has been successfully created'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function edit(Gerso $gerso)
    {
        return view('back.souscategories.form', ['gerso' => $gerso]);
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\ProductRequest  $request
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function update(GersoRequest $request, Gerso $gerso)
    {
        
        $gerso->update($request->all());

        return back()->with('ok', __('The sous categorie has been successfully updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function destroy(Gerso $gerso)
    {
        $gerso->delete();

        return response()->json();
    }


}
