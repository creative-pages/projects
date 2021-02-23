<?php

use Illuminate\Support\Facades\Route;

Route::get('/', 'SiteController@index')->name('index');
Route::get('/product', 'SiteController@product')->name('product');

Auth::routes();

Route::get('/dashboard', 'HomeController@index')->name('home');

Route::middleware(['auth'])->group(function() {
// brand
Route::get('/brand/add-brand', 'BrandController@addBrand')->name('add.brand');
Route::post('/brand/store-brand', 'BrandController@storeBrand')->name('store.brand');
Route::get('/brand/manage-brand', 'BrandController@manageBrand')->name('manage.brand');
Route::get('/brand/edit-brand/{id}', 'BrandController@editBrand');
Route::post('/brand/update-brand/{id}', 'BrandController@updateBrand')->name('update.brand');
Route::get('/brand/brand-status/{id}/{s}', 'BrandController@brandStatus');

Route::get('/brand/delete-brand/{id}', 'BrandController@deleteBrand')->name('delete.brand');

// category
Route::get('/category/add-category', 'CategoryController@addCategory')->name('add.category');
Route::post('/category/store-category', 'CategoryController@storeCategory')->name('store.category');
Route::get('/category/edit-category/{id}', 'CategoryController@editCategory')->name('edit.category');
Route::post('/category/update-category/{id}', 'CategoryController@updateCategory')->name('update.category');
Route::get('/category/category-status/{id}/{s}', 'CategoryController@categoryStatus');
Route::get('/category/delete-category/{id}', 'CategoryController@deleteCategory')->name('delete.category');

Route::get('/category/manage-category', 'CategoryController@manageCategory')->name('manage.category');


Route::get('/category/add-sub-category', 'SubCategoryController@addSubCategory')->name('add.sub.category');
Route::post('/category/store-sub-category', 'SubCategoryController@storeSubCategory')->name('store.sub.category');
Route::get('/category/edit-sub-category/{id}', 'SubCategoryController@editSubCategory')->name('edit.sub.category');
Route::post('/category/update-sub-category/{id}', 'SubCategoryController@updateSubCategory')->name('update.sub.category');
Route::get('/category/sub-category-status/{id}/{s}', 'SubCategoryController@subCategoryStatus');
Route::get('/category/delete-sub-category/{id}', 'SubCategoryController@deleteSubCategory')->name('delete.sub.category');
Route::get('/category/manage-sub-category', 'SubCategoryController@manageSubCategory')->name('manage.sub.category');

Route::get('/category/manage-sub-sub-category', 'SubSubCategoryController@manageSubSubCategory')->name('manage.sub.sub.category');
});