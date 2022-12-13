<?php

namespace App\Http\Controllers\Back;

use App\Http\{
    Controllers\Controller,
    Requests\Back\CategoryRequest
};
use App\DataTables\CategoriesDataTable;
use App\Models\Category;
use Intervention\Image\Facades\Image as InterventionImage;
use Illuminate\Support\Facades\File;

class CategoryController extends Controller
{
       /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(CategoriesDataTable $dataTable)
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
        return view('back.categories.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
   
    public function store(CategoryRequest $request)
    {
        $inputs = $this->getInputs($request);

        Category::create($inputs);

        return back()->with('ok', __('The categorie has been successfully created'));
    }

    protected function saveImages($request)
    {
        $image = $request->file('image');
        $name = time() . '.' . $image->extension();
        $img = InterventionImage::make($image->path());
        $img->widen(800)->encode()->save(public_path('/storage/categories/') . $name);
        $img->widen(400)->encode()->save(public_path('/storage/categories/categoriesimages/') . $name);

        return $name;
    }

    protected function getInputs($request)
    {
        $inputs = $request->except(['image']);

        $inputs['active'] = $request->has('active');

        if($request->image) {
            $inputs['image'] = $this->saveImages($request);
        }

        return $inputs;
    }
    protected function deleteImages($category)
    {
        File::delete([
            public_path('/storage/categories/') . $category->image, 
            public_path('/storage/categories/categoriesimages/') . $category->image,
        ]);    
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        return view('back.categories.form', ['category' => $category]);
    }
    

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\ProductRequest  $request
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function update(CategoryRequest $request, Category $category)
    {
        $inputs = $this->getInputs($request);

        if($request->has('image')) {
            $this->deleteImages($category);        
        }

        $category->update($inputs);

        return back()->with('ok', __('The categorie has been successfully updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product $produit
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        $this->deleteImages($category); 

        $category->delete();

        return response()->json();


    }

    
}
