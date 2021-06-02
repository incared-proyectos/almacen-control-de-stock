<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venta_cliente extends Model
{
    use HasFactory;
    protected $fillable = [
        'codigo',
        'cifnif',
        'direccion',
        'nombres',
        'apellidos',
        'telefono',
        'ciudad',
        'fpago',
        'ruta_id',
        'fecha_venta',
        'vehiculo_id',
        'total_precio'
    ];

    public function ruta()
    {
        return $this->belongsTo('App\Models\Ruta');
    }
    public function Vehiculo()
    {
        return $this->belongsTo('App\Models\Vehiculo');
    }
    public function Venta_clientes_lineas()
    {
        return $this->hasMany('App\Models\Venta_clientes_linea');
    }
}
