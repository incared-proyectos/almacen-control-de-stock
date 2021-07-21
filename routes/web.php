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
    return redirect('/login');
});

Auth::routes();

Route::get('/pdf_init/{id}', [App\Http\Controllers\Venta_ClientesController::class, 'pdf_init']);


Route::get('/{any?}',[App\Http\Controllers\PageController::class, 'index'])->where('any', '.*')->middleware('auth:sanctum');