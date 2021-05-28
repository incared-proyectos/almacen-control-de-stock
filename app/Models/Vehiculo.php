<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vehiculo extends Model
{
    use HasFactory;
    protected $fillable = [
        'nombre',
        'modelo',
        'marca',
        'color',
        'rutas_json',
    ];

    public function productos()
	{
	    return $this->belongsToMany('App\Models\Producto', 'stock_vehiculos', 'vehiculos_id', 'productos_id')->withPivot('stock_product');
	}
}
