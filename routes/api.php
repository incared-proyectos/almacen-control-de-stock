<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


//MODULE ALMACEN
Route::group(['prefix'=>'almacen','as'=>'almacen.'], function(){
	Route::get('/', [App\Http\Controllers\AlmacenController::class, 'index'])->name('index');

});


//MODULE PRODUCTOS
Route::group(['prefix'=>'productos','as'=>'productos.'], function(){
	Route::get('/', [App\Http\Controllers\ProductoController::class, 'index'])->name('index');

});

//MODULE RUTAS
Route::group(['prefix'=>'rutas','as'=>'rutas.'], function(){
	Route::get('/', [App\Http\Controllers\RutaController::class, 'index'])->name('index');

});


