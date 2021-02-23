<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\SubCategory;
use App\Category;

class SubCategoryController extends Controller
{
    public function manageSubCategory() {
    	$subCategory = SubCategory::with('Category')->get();
    	return view('admin.category.manage-sub-category', compact('subCategory'));
    }
    public function addSubCategory() {
    	$all_category = Category::all();
    	return view('admin.category.add-sub-category', compact('all_category'));
    }
    public function storeSubCategory(Request $request) {
    	$request->validate([
    		'cat_id' => 'required',
    		'subcat_name' => 'required|unique:sub_categories,subcat_name|min:4|max:255',
    	],
    	[
    		'cat_id.required' => 'Please select a category.',
    	]);
    	$subCategory = new SubCategory();
    	$subCategory->cat_id = $request->cat_id;
    	$subCategory->subcat_name = $request->subcat_name;
    	$subCategory->save();
    	return Redirect()->back()->with('success', 'Sub-Category added successfully.');
    }
    public function subCategoryStatus($id, $status) {
    	$subCategory = SubCategory::find($id);
    	$subCategory->status = $status;
    	$subCategory->save();
    	return response()->json(['message' => 'Success']);
    }
    public function deleteSubCategory($id) {
    	$deleteSubCat = SubCategory::find($id);
    	$deleteSubCat->forceDelete();
    	return Redirect()->back();
    }
    public function editSubCategory($id) {
    	$singleSubCat = SubCategory::find($id);
    	$all_category = Category::all();
    	return view('admin.category.update-sub-category', compact('singleSubCat', 'all_category'));
    }
    public function updateSubCategory(Request $request, $id) {
    	$subCategory = SubCategory::find($id);
    	$request->validate([
    		'cat_id' => 'required',
    		'subcat_name' => 'required|min:4|max:255',
    	],
    	[
    		'cat_id.required' => 'Please select a category.',
    	]);
    	$subCategory->cat_id = $request->cat_id;
    	$subCategory->subcat_name = $request->subcat_name;
    	$subCategory->save();
    	return Redirect()->back()->with('success', 'Sub-Category updated successfully.');
    }
}
