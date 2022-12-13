<?php


namespace App\Http\Controllers\Back;

use App\Http\{
    Controllers\Controller,
    Requests\Back\FichierRequest
};
use App\DataTables\FichiersDataTable;
use App\Models\Fichier;
use Symfony\Component\HttpFoundation\Request;
use Illuminate\Support\Facades\Storage;
use BaconQrCode\Renderer\Path\Path;


class FichierController extends Controller
{
       /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(FichiersDataTable $dataTable)
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
        return view('back.files.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
   
    public function store(Request $request)
    {
        $data = new Fichier();

        $image = $request->image;
        $name = time() . '.' . $image->extension();
        $request->image->move('storage/files',$name);

        $data->image = $name;
        $data->title = $request->title;
        $data->slug = $request->slug;

        $data->save();

        return back()->with('ok', __('The fille has been successfully created'));
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function edit(Fichier $document)
    {
        return view('back.files.form', ['document' => $document]);
    }
    

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\ProductRequest  $request
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function update(FichierRequest $request, Fichier $fichier)
    {
        $image = $request->image;
        $name = time() . '.' . $image->extension();
        $request->image->move('storage/files',$name);

        $fichier->image = $name;
        $fichier->title = $request->title;
        $fichier->slug = $request->slug;

        $fichier->update();

        return back()->with('ok', __('The file has been successfully updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function destroy(Fichier $fichier)
    {

        $fichier->delete();

        return response()->json();

    }

   
}
