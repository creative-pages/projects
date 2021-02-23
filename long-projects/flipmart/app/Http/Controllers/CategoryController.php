<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;

class CategoryController extends Controller
{
    public function manageCategory() {
    	$category_list = Category::latest()->get();
    	return view('admin.category.manage-category', compact('category_list'));
    }
    public function addCategory() {
    	return view('admin.category.add-category');
    }
    public function storeCategory(Request $request) {
    	$request->validate([
    		'category_name' => 'required|unique:categories,category_name|min:4|max:255'
    	]);
    	$category = new Category();
    	$category->category_name = $request->category_name;
    	$category->category_slug = $this->slug_generator($request->category_name);
    	$category->save();

    	return Redirect()->back()->with('success', 'Category added successfully.');
    }
    public function editCategory($id) {
    	$singleCat = Category::find($id);
    	return view('admin.category.edit-category', compact('singleCat'));
    }
    public function updateCategory(Request $request, $id) {
    	$category = Category::find($id);
    	$request->validate([
    		'category_name' => 'required|unique:categories,category_name|min:4|max:255'
    	]);

    	$category->category_name = $request->category_name;
    	$category->category_slug = $this->slug_generator($request->category_name);
    	$category->save();
    	return Redirect()->back()->with('success', 'Category updated successfully.');
    }
    public function categoryStatus($id, $status) {
    	$category = Category::find($id);
    	$category->status = $status;
    	$category->save();
    	return response()->json(['message' => 'Success']);
    }
    public function deleteCategory($id) {
    	$category = Category::find($id);
    	$category->forceDelete();
    	return Redirect()->back();
    }

    public function slug_generator($string) {
    	$string = str_replace(' ', '-', $string);
    	$string = preg_replace('/[^A-Za-z0-9\-]/', '', $string);
    	return strtolower(preg_replace('/-+/', '', $string));
    }
}
