<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// frontend
Route::get('/', function () {
    return view('frontend.index');
});
Route::get('/about-us', function () {
    return view('frontend.about-us');
})->name('about.us');


Auth::routes();

Route::get('admin', 'HomeController@index')->name('home');

// category
Route::get('/all-category', 'CategoryController@allCategory')->name('all.category');
Route::post('/add-category', 'CategoryController@addCategory')->name('store.category');
Route::get('/edit-category/{id}', 'CategoryController@editCategory');
Route::post('/update-category', 'CategoryController@updateCategory')->name('update.category');
Route::get('/softdelete-category/{id}', 'CategoryController@softDeleteCategory');
Route::get('/restore-category/{id}', 'CategoryController@restoreCategory');
Route::get('/parmanent-category/{id}', 'CategoryController@parmanentCategory');

// brand
Route::get('/all-brand', 'BrandController@allBrand')->name('all.brand');
Route::post('/add-brand', 'BrandController@addBrand')->name('store.brand');
Route::get('/edit-brand/{id}', 'BrandController@editBrand');
Route::post('/update-brand/{id}', 'BrandController@updateBrand');
Route::get('/delete-brand/{id}', 'BrandController@deleteBrand');


// multiple image
Route::get('/multiple-image', 'MultiImageController@multiImg')->name('multi.image');
Route::post('/addmulti-image', 'MultiImageController@addMultiImg')->name('store.image');

// user profile
Route::get('/user-profile', 'MultiImageController@userProfile')->name('profile');
Route::post('/profile-update', 'MultiImageController@updateProfile')->name('update.user');
Route::get('/change-password', 'MultiImageController@changePassword')->name('change.password');
Route::post('/update-password', 'MultiImageController@updatePassword')->name('update.password');