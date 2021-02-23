<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Brand;
use Image;

class BrandController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function allBrand() {
    	$brand = Brand::latest()->paginate(5);
    	return view('admin.brand.index', compact('brand'));
    }
    public function addBrand(Request $request) {
    	$request->validate([
    		'brand_name' => 'required|min:4',
    		'brand_image' => 'required|mimes:jpg,jpeg,png,gif',
    	],
    	[
    		'brand_name.required' => 'Brand is required.',
    		'brand_name.min' => 'Brand name should be minimum 4 characters.',
    	]);

    	$brand_image = $request->file('brand_image');
    	$name_gen = hexdec(uniqid());
    	$img_ext = strtolower($brand_image->getClientOriginalExtension());
    	$img_name = $name_gen . '.' . $img_ext;
    	$up_location = 'images/brand/';
    	$last_img = $up_location . $img_name;
    	$brand_image->move($up_location, $img_name);

    	Brand::insert([
    		'brand_name' => $request->brand_name,
    		'brand_image' => $last_img,
    		'created_at' => Carbon::now(),
    	]);

    	return Redirect()->back()->with('success', 'Brand inserted successfully.');
    }
    public function editBrand($id) {
    	$singleBrand = Brand::find($id);
    	return view('admin.brand.edit', compact('singleBrand'));
    }
    public function updateBrand(Request $request, $id) {
    	$request->validate([
    		'brand_name' => 'required|min:4',
    		'brand_image' => 'mimes:jpg,jpeg,png,gif',
    	],
    	[
    		'brand_name.min' => 'Brand name should be minimum 4 characters.',
    	]);
    	$old_img = $request->old_img;
    	$brand_image = $request->file('brand_image');

    	if ($brand_image) {
	    	
	    	$name_gen = hexdec(uniqid()) . '.' . strtolower($brand_image->getClientOriginalExtension());
	    	Image::make($brand_image)->resize(150, 80)->save('images/brand/' . $name_gen);
	    	$last_img = 'images/brand/' . $name_gen;

    		if (isset($old_img)) {
    			unlink($old_img);
    		}
	    	Brand::find($id)->update([
	    		'brand_name' => $request->brand_name,
	    		'brand_image' => $last_img,
	    		'created_at' => Carbon::now(),
	    	]);

	    	return Redirect()->back()->with('success', 'Brand inserted successfully.');
    	} else {
	    	Brand::find($id)->update([
	    		'brand_name' => $request->brand_name,
	    		'created_at' => Carbon::now(),
	    	]);

	    	return Redirect()->back()->with('success', 'Brand inserted successfully.');
    	}
    }
    public function deleteBrand($id) {
    	$img = Brand::find($id);
    	$brand_image = $img->brand_image;
    	unlink($brand_image);
    	Brand::find($id)->delete();
    	return Redirect()->back()->with('success', 'Brand deleted successfully.');
    }
}
