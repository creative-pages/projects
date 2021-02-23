<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Category;

class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function allCategory() {
    	$category = Category::latest()->paginate(5);
    	$trashCat = Category::onlyTrashed()->latest()->paginate(3);
    	return view('admin.category.index', compact('category', 'trashCat'));
    }
    public function addCategory(Request $request) {
    	$request->validate([
	        'category_name' => 'required|min:4',
	    ],
	    [
	        'category_name.required' => 'Category name is required!',
	        'category_name.min' => 'Category name should be minimum 4 characters!',
	    ]);

    	Category::insert([
    		'user_id' => Auth::user()->id,
    		'category_name' => $request->category_name,
    		'created_at' => Carbon::now(),
    	]);

    	return Redirect()->back()->with('success', 'Category added successfully.');
    }
    public function editCategory($id) {
    	// $singleCat = Category::find($id);
    	$singleCat = DB::table('categories')->where('id', $id)->first();
    	return view('admin.category.edit', compact('singleCat'));
    }
    public function updateCategory(Request $request) {
    	$request->validate([
	        'category_name' => 'required|min:4',
	    ],
	    [
	        'category_name.required' => 'Category name is required!',
	        'category_name.min' => 'Category name should be minimum 4 characters!',
	    ]);
    	$id = $request->cat_id;
    	Category::find($id)->update([
    		'user_id' => Auth::user()->id,
    		'category_name' => $request->category_name,
    		'updated_at' => Carbon::now(),
    	]);


    	return Redirect()->route('all.category')->with('success', 'Category updated successfully.');
    }
    public function softDeleteCategory($id) {
    	$delete = Category::find($id)->delete();
    	return Redirect()->back()->with('success', 'Category deleted successfully.');
    }
    public function restoreCategory($id) {
    	$delete = Category::withTrashed()->find($id)->restore();
    	return Redirect()->back()->with('success', 'Category restored successfully.');
    }
    public function parmanentCategory($id) {
    	$delete = Category::onlyTrashed()->find($id)->forceDelete();
    	return Redirect()->back()->with('success', 'Category parmanently deleted.');
    }
}
