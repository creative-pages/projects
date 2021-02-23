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

Route::get('/', function () {
    return view('pages.index');
})->name('index');
// pages
Route::get('/about-us', 'FrontEndController@About')->name('about.us');

Auth::routes(['verify' => true]);

Route::get('/admin', 'HomeController@index')->name('admin')->middleware('verified');

// Category
Route::get('/all-category', 'CategoryController@AllCat')->name('all.category');

Route::post('/add-category', 'CategoryController@AddCat')->name('store.category');

Route::get('/edit-category/{id}', 'CategoryController@EditCat');
Route::post('/Update-category/{id}', 'CategoryController@UpdateCat');

Route::get('/softdelete-category/{id}', 'CategoryController@SoftDeleteCat');

Route::get('/restore-category/{id}', 'CategoryController@ResDelete');

Route::get('/pDelete-category/{id}', 'CategoryController@PerDelete');

// Brand
Route::get('/all-brand', 'BrandController@AllBrand')->name('all.Brand');

Route::post('/add-brand', 'BrandController@StoreBrand')->name('store.brand');
Route::get('/edit-brand/{id}', 'BrandController@EditBrand');
Route::post('/update-brand/{id}', 'BrandController@UpdateBrand');
Route::get('/delete-brand/{id}', 'BrandController@DeleteBrand');
Route::get('/mutiple-image', 'BrandController@Index')->name('multiple.image');
Route::post('/store-image', 'BrandController@StoreImg')->name('store.image');

// User
Route::get('/user-profile/', 'BrandController@UserProfile')->name('user-profile');
Route::post('/user-profile-update/', 'BrandController@UpdateProfile')->name('update.profile');
Route::get('/user-password/', 'BrandController@ChangePassword')->name('change.password');
Route::post('/update-password/', 'BrandController@UpdatePassword')->name('update.password');