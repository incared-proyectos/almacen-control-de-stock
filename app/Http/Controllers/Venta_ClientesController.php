<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use App\Models\Venta_cliente;
use App\Models\Venta_clientes_linea;
use App\Models\Producto;
use App\Models\Stock_vehiculo;
use App\Models\Ruta;
use App\Models\Forma_de_pago;
class Venta_ClientesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table = Datatables::of(Venta_cliente::all());
        $table->addColumn('action', function($row){
            return '';
        })->rawColumns(['action']);
        return $table->make(true);      
    }
    public function stocks_productos($id)
    {
        $table = Datatables::of(Producto::all());
        $table->addColumn('action', function($row){
            return 'delete';
        })->addColumn('stock_actual', function($row) use ($id){
           $vehiculo = Stock_vehiculo::where('vehiculos_id',$id)->where('productos_id',$row['id'])->first();
           if (empty($vehiculo)) {
               return 0;
           }
           return $vehiculo->stock_product;
        })->addColumn('stock_venta', function($row){
            return 0;
        })->addColumn('producto_id', function($row){
            return $row['id'];
        })->rawColumns(['action','stock_vehicle']);
        return $table->make(true);    
    }

    /*
    * VALIDATIONS FORMS
    */
    public function validate_form($all){
        $validator = Validator::make($all,[
            'fpago' => 'required',
            'codigo' => 'required',
            'created_at' => 'required',
            'cifnif' => 'required',
            'nombres' => 'required',
            'direccion'=>'required',
            'apellidos' => 'required',
            'ventas_lineas'=>'required'
        ]);
        return $validator;
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return response()->json(
            [
                'fpagos'=>Forma_de_pago::all(),
                'rutas'=> Ruta::all()
            ]
        );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $all =  $request->all();
        $validator = $this->validate_form($all);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $table = new Venta_cliente();
            $table->fill($all)->save();
            $ventac = Venta_cliente::latest('id')->first();
            foreach ($all['ventas_lineas'] as $lineas) {
                if ($lineas['stock_venta'] > 0) {       
                    $stock_vehiculos = Stock_vehiculo::where('vehiculos_id',$all['vehiculo_id'])->where('productos_id',$lineas['producto_id'])->first();
                    $table_lineas = new Venta_clientes_linea();
                    $table_lineas->nombre = $lineas['nombre'];
                    $table_lineas->stock_venta = $lineas['stock_venta'];
                    $table_lineas->precio = $lineas['precio'];
                    $table_lineas->producto_id = $lineas['producto_id'];
                    $table_lineas->venta_cliente_id = $ventac->id;
                    $stock_vehiculos->stock_product = $lineas['stock_actual'];
                    $stock_vehiculos->save();
                    $table_lineas->save();
                }
            }

            return response()->json(['success'=>'Venta guardada con exito']);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function ventas_lineas($id)
    {
        $ventas_lineas = Venta_clientes_linea::where('venta_cliente_id',$id)->get();
        $ventas = Venta_cliente::find($id);
        $vehiculo = Stock_vehiculo::where('vehiculos_id',$ventas->vehiculo_id)->first();

        $table = Datatables::of(Venta_clientes_linea::where('venta_cliente_id',$id)->get());
        $table->addColumn('action', function($row){
            return 'delete';
        })->addColumn('stock_actual', function($row) use ($id){

           $ventas = Venta_cliente::find($id);
           $vehiculo = Stock_vehiculo::where('vehiculos_id',$ventas->vehiculo_id)->where('productos_id',$row['producto_id'])->first();
           if (empty($vehiculo)) {
               return 0;
           }
           return $vehiculo->stock_product;
        })->addColumn('stock', function($row){
            $producto = Producto::where('id',$row['producto_id'])->first();
            return $producto->stock;
        })->rawColumns(['action']);
        return $table->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        return response()->json(
            [
                'data'=>Venta_cliente::with('vehiculo','ruta')->where('id',$id)->first(),
                'fpagos'=>Forma_de_pago::all(),
                'rutas'=> Ruta::all()
            ]
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $all =  $request->all();
        $validator = $this->validate_form($all);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $table =  Venta_cliente::find($all['id']);
            $table->fill($all)->save();
            foreach ($all['ventas_lineas'] as $lineas) {
                if ($lineas['stock_venta'] > 0) {          
                    $stock_vehiculos = Stock_vehiculo::where('vehiculos_id',$all['vehiculo_id'])->where('productos_id',$lineas['producto_id'])->first();
    
                    $table_lineas = Venta_clientes_linea::find($lineas['id']);
                    $table_lineas->nombre = $lineas['nombre'];
                    $table_lineas->stock_venta = $lineas['stock_venta'];
                    $table_lineas->precio = $lineas['precio'];
                    //$table_lineas->producto_id = $lineas['producto_id'];
                    //$table_lineas->venta_cliente_id = $ventac->id;
                    $stock_vehiculos->stock_product =  $lineas['stock_actual'];
                    $stock_vehiculos->save();
                    $table_lineas->save();
                }
            }

            return response()->json(['success'=>'Venta actualizada con exito']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $all = $request->all();

        $table = Venta_cliente::find($all['id_data']);

        if ($table) {
            $lineas = Venta_clientes_linea::where('venta_cliente_id',$all['id_data'])->delete();
            $table->delete();
        }
    }
}
