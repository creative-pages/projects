<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\Brand;
use App\MultipleImage;
use Image;

class BrandController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function AllBrand() {
    	$brand = Brand::latest()->paginate(5);
    	return view('admin.brand.index', compact('brand'));
    }

    public function StoreBrand(Request $request) {
    	$request->validate([
    		'brand_name' => 'required|min:4|max:50',
    		'brand_image' => 'required|mimes:jpg,jpeg,gif,png',
    	],
    	[
    		'brand_name.required' => 'Brand is required.',
    		'brand_name.min' => 'Should be minimum 4 charecters.',
    		'brand_name.max' => 'Should be maximum 50 charecters.',
    		'brand_image.required' => 'Image is required.',
    		'brand_image.mimes' => 'You can upload only:- jpg, jpeg, gif.',
    	]);

    	$brand_image = $request->file('brand_image');


    	$name_gen = hexdec(uniqid()) . '.' . strtolower($brand_image->getClientOriginalExtension());
    	Image::make($brand_image)->resize(100, 60)->save('images/brand/' . $name_gen);
    	$last_img = 'images/brand/' . $name_gen;

    	Brand::insert([
    		'user_id' => Auth::user()->id,
    		'brand_name' => $request->brand_name,
    		'brand_image' => $last_img,
    		'created_at' => Carbon::now(),
    	]);

    	return Redirect()->back()->with('success', 'Brand inserted successfully.');
    }

    public function EditBrand($id) {
    	$singleBrand = Brand::find($id);
    	return view('admin.brand.edit', compact('singleBrand'));
    }
    public function UpdateBrand(Request $request, $id) {
    	$request->validate([
    		'brand_name' => 'required|max:50|min:4',
    		'brand_image' => 'mimes:jpg,jpeg,png,gif',
    	],
    	[
    		'brand_name.required' => 'Brand name is required.',
    		'brand_name.max' => 'Should be maximum 50 characters.',
    		'brand_name.min' => 'Should be minimum 4 characters.',
    		'brand_image.mimes' => 'You can upload only:- jpg,jpeg,png,gif.',
    	]);
    	$old_image = $request->old_img;
    	$brand_image = $request->file('brand_image');

    	if ($brand_image) {
    		if ($old_image) {
	    		unlink($old_image);
	    	}

    		$name_gen = hexdec(uniqid()) . '.' . strtolower($brand_image->getClientOriginalExtension());
	    	Image::make($brand_image)->resize(100, 60)->save('images/brand/' . $name_gen);
	    	$last_img = 'images/brand/' . $name_gen;

	    	Brand::find($id)->update([
	    		'user_id' => Auth::user()->id,
	    		'brand_name' => $request->brand_name,
	    		'brand_image' => $last_img,
	    		'updated_at' => Carbon::now(),
	    	]);
	    	return Redirect()->back()->with('success', 'Brand updated successfully.');
    	} else {
	    	Brand::find($id)->update([
	    		'user_id' => Auth::user()->id,
	    		'brand_name' => $request->brand_name,
	    		'updated_at' => Carbon::now(),
	    	]);
	    	return Redirect()->back()->with('success', 'Brand updated successfully.');
    	}
    }
    public function DeleteBrand($id) {
    	$deleteBrand = Brand::find($id);
    	$delete_file = $deleteBrand->brand_image;

    	Brand::find($id)->delete();
    	unlink($delete_file);
    	return Redirect()->back()->with('success', 'Brand deleted successfully.');
    }

    public function Index() {
    	$multi_img = MultipleImage::latest()->get();
    	return view('admin.multi_img.index', compact('multi_img'));
    }
    public function StoreImg(Request $request) {
    	$image = $request->file('images');

    	foreach ($image as $multi_img) {
    		$name_gen = hexdec(uniqid()) . '.' . strtolower($multi_img->getClientOriginalExtension());
	    	Image::make($multi_img)->resize(250, 150)->save('images/multi_img/' . $name_gen);
	    	$last_img = 'images/multi_img/' . $name_gen;

	    	MultipleImage::insert([
	    		'images' => $last_img,
	    		'created_at' => Carbon::now(),
	    	]);
    	}

    	return Redirect()->back()->with('success', 'Image inserted successfully.');
    }


    // user profile
    public function UserProfile() {
        return view('admin.user.index');
    }
    public function UpdateProfile(Request $request) {
        $request->validate([
            'name' => 'required|min:4',
            'email' => 'required|email',
        ]);
        $id = Auth::user()->id;
        User::find($id)->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);
        return Redirect()->back()->with('success', 'User profile updated successfully.');
    }
    public function ChangePassword() {
        return view('admin.user.password');
    }
    public function UpdatePassword(Request $request) {
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required',
            'confirm_password' => 'required',
        ]);

        $dbPassword = Auth::user()->password;
        $old_password = $request->old_password;
        $new_password = $request->new_password;
        $confirm_password = $request->confirm_password;
        $id = Auth::user()->id;
        if (Hash::check($old_password, $dbPassword)) {
            if ($new_password === $confirm_password) {
                User::find($id)->update([
                    'password' => Hash::make($request->confirm_password),
                ]);
                Auth::logout();
                return Redirect()->route('login');
            } else {
                return Redirect()->back()->with('notMatch', 'Confirm password not matched!');
            }
        } else {
            return Redirect()->back()->with('error', 'Old password not matched!');
        }
    }
}
