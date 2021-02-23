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
    public function AllCat() {
    	$category = Category::latest()->paginate(5);
    	$trashCat = Category::onlyTrashed()->latest()->paginate(3);
    	return view('admin.category.index', compact('category', 'trashCat'));
    }
    public function AddCat(Request $request) {
    	$request->validate([
	        'category_name' => 'required|max:50',
	    ],
	    [
	        'category_name.required' => 'Please enter a category name.',
	        'category_name.max' => 'Category name should not be more than 5 characters.',
	    ]);
    	Category::insert([
    		'user_id' => Auth::user()->id,
    		'category_name' => $request->category_name,
    		'created_at' => Carbon::now(),
    	]);
	    return Redirect()->back()->with('success', 'Category added successfully.');
    }
    public function EditCat($id) {
    	$category = Category::find($id);
    	// $category = DB::table('categories')->where('id',$id)->first();
    	return view('admin.category.edit', compact('category'));
    }
    public function UpdateCat(Request $request, $id) {
    	$request->validate([
	        'category_name' => 'required|max:50',
	    ],
	    [
	        'category_name.required' => 'Please enter a category name.',
	        'category_name.max' => 'Category name should not be more than 5 characters.',
	    ]);
    	// $request = Category::find($id)->update([
    	// 	'category_name' => $request->category_name,
    	// 	'user_id' => Auth::user()->id,
    	// ]);

    	$data = array();
    	$data['category_name'] = $request->category_name;
    	$data['user_id'] = Auth::user()->id;
    	$data['category_name'] = $request->category_name;
    	$data['updated_at'] = Carbon::now();

    	DB::table('categories')->where('id',$id)->update($data);
    	return Redirect()->route('all.category')->with('success', 'Category updated successfully.');
    }
    public function SoftDeleteCat($id) {
    	Category::find($id)->delete();
    	return Redirect()->back()->with('success', 'Category deleted successfully.');
    }
    public function ResDelete($id) {
    	Category::withTrashed()->find($id)->restore();
    	return Redirect()->back()->with('success', 'Category restored successfully.');
    }
    public function PerDelete($id) {
    	Category::onlyTrashed()->find($id)->forceDelete();
    	return Redirect()->back()->with('success', 'Category permanently deleted.');
    }
}
