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
	Route::get('/stocks_productos/{id}', [App\Http\Controllers\ProductoController::class, 'stocks_productos'])->name('stocks_productos');

});

//MODULE RUTAS
Route::group(['prefix'=>'rutas','as'=>'rutas.'], function(){
	Route::get('/', [App\Http\Controllers\RutaController::class, 'index'])->name('index');
	Route::get('/rutas', [App\Http\Controllers\RutaController::class, 'all'])->name('all');

});

//MODULE VEHICULOS
Route::group(['prefix'=>'vehiculos','as'=>'vehiculos.'], function(){
	Route::get('/', [App\Http\Controllers\VehiculosController::class, 'index'])->name('index');
	Route::get('/getby/{id}', [App\Http\Controllers\VehiculosController::class, 'getby'])->name('getby');
	Route::get('/all', [App\Http\Controllers\RutaController::class, 'all'])->name('all');

	Route::get('/create', [App\Http\Controllers\VehiculosController::class, 'create'])->name('create');
	Route::get('/edit/{id}', [App\Http\Controllers\VehiculosController::class, 'edit'])->name('edit');
	Route::post('/save', [App\Http\Controllers\VehiculosController::class, 'store'])->name('save');
	Route::post('/delete', [App\Http\Controllers\VehiculosController::class, 'destroy'])->name('delete');
	Route::post('/update', [App\Http\Controllers\VehiculosController::class, 'update'])->name('update');

});


//MODULE CLIENTES
Route::group(['prefix'=>'clientes','as'=>'clientes.'], function(){
	Route::get('/', [App\Http\Controllers\ClienteController::class, 'index'])->name('index');

	Route::get('/create', [App\Http\Controllers\ClienteController::class, 'create'])->name('create');
	Route::get('/edit/{id}', [App\Http\Controllers\ClienteController::class, 'edit'])->name('edit');
	Route::post('/save', [App\Http\Controllers\ClienteController::class, 'store'])->name('save');
	Route::post('/update', [App\Http\Controllers\ClienteController::class, 'update'])->name('update');
	Route::post('/search', [App\Http\Controllers\ClienteController::class, 'search'])->name('search');
	Route::post('/delete', [App\Http\Controllers\ClienteController::class, 'destroy'])->name('delete');

});

//MODULE VENTAS CLIENTES
Route::group(['prefix'=>'ventas_clientes','as'=>'ventas_clientes.'], function(){
	Route::get('/', [App\Http\Controllers\Venta_ClientesController::class, 'index'])->name('index');
	Route::get('/stocks_productos/{id}', [App\Http\Controllers\Venta_ClientesController::class, 'stocks_productos'])->name('stocks_productos');
});



