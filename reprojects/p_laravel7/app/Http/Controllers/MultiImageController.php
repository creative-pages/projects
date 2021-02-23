<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\MultiImg;
use App\User;
use Image;

class MultiImageController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth');
    }
    public function multiImg() {
    	$images = MultiImg::latest()->get();
    	return view('admin.multiimg.index', compact('images'));
    }
    public function addMultiImg(Request $request) {
    	$images = $request->file('images');
    	foreach ($images as $multiImg) {
    		$name_gen = hexdec(uniqid()) . '.' . strtolower($multiImg->getClientOriginalExtension());
	    	Image::make($multiImg)->resize(300, 200)->save('images/multiimg/' . $name_gen);
		    $last_img = 'images/multiimg/' . $name_gen;
	    	MultiImg::insert([
	    		'images' => $last_img,
	    		'created_at' => Carbon::now(),
	    	]);
    	}
    	
    	return Redirect()->back()->with('success', 'Images inserted successfully.');
    }

    // user profile
    public function userProfile() {
    	return view('admin.profile.index');
    }
    public function updateProfile(Request $request) {
    	$request->validate([
    		'name' => 'required|min:4',
    		'email' => 'required|email',
    	]);
    	$id = Auth::user()->id;

    	User::find($id)->update([
    		'name' => $request->name,
    		'email' => $request->email,
    	]);
    	return Redirect()->back()->with('success', 'Profile updated successfully.');
    }
    public function changePassword() {
    	return view('admin.profile.change-password');
    }
    public function updatePassword(Request $request) {
    	$request->validate([
    		'old_pass' => 'required',
    		'new_pass' => 'required',
    		'confirm_pass' => 'required',
    	]);
    	$db_pass = Auth::user()->password;
    	$id = Auth::user()->id;

    	$old_pass = $request->old_pass;
    	$new_pass = $request->new_pass;
    	$confirm_pass = $request->confirm_pass;

    	if (Hash::check($old_pass, $db_pass)) {
    		if ($new_pass === $confirm_pass) {
    			User::find($id)->update([
    				'password' => Hash::make($confirm_pass),
    			]);
    			Auth::logout();
    			return Redirect()->route('login');
    		} else {
	    		return Redirect()->back()->with('new_matched', 'Confirm password not matched!');
	    	}
    	} else {
    		return Redirect()->back()->with('old_match', 'Old password not matched!');
    	}
    }
}
