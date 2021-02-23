<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Brand;
use DB;

class BrandController extends Controller
{
    public function addBrand() {
    	return view('admin.add-brand');
    }
    public function storeBrand(Request $request) {
    	$request->validate([
    		'brand_name' => 'required|unique:brands,brand_name|min:4|max:255'
    	]);
    	$brand = new Brand();
    	$brand->brand_name = $request->brand_name;
    	$brand->brand_slug = $this->slug_generator($request->brand_name);
    	$brand->save();

    	return Redirect()->back()->with('success', 'Brand added successfully.');
    }
    public function manageBrand() {
        $brand_list = Brand::latest()->get();
    	return view('admin.brand-list', compact('brand_list'));
    }
    public function editBrand($id) {
        $single_brand = Brand::find($id);
        return view('admin.edit-brand', compact('single_brand'));
    }
    public function updateBrand(Request $request, $id) {
        $brand = Brand::find($id);
        $request->validate([
            'brand_name' => 'required|unique:brands,brand_name|min:4|max:255'
        ]);

        $brand->brand_name = $request->brand_name;
        $brand->brand_slug = $this->slug_generator($request->brand_name);
        $brand->save();

        return Redirect()->back()->with('success', 'Brand updated successfully.');
    }
    public function brandStatus($id, $status) {
        $find_brand = Brand::find($id);

        $find_brand->status = $status;
        $find_brand->save();
        return response()->json(['message' => 'Success']);
    }
    public function deleteBrand($id) {
        $delete_brand = Brand::find($id);
        $delete_brand->forceDelete();
        return Redirect()->back();
    }

    // slug generator
    public function slug_generator($string) {
    	$string = str_replace(' ', '-', $string);
    	$string = preg_replace('/[^A-Za-z0-9\-]/', '', $string);
    	return strtolower(preg_replace('/-+/', '', $string));
    }
}
