<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use App\Models\Vehiculo;
use App\Models\Producto;
use App\Models\Stock_vehiculo;
use App\Models\Stock_historia;
use App\Models\Ruta;

class VehiculosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

       $table = Datatables::of(Vehiculo::all());
        $table->addColumn('action', function($row){
            return '';
        })->rawColumns(['action']);
        return $table->make(true);     
    }
    public function getby($id){
        $all = Vehiculo::with('productos')->get();
        $all_vehiculos = [];
        foreach ($all as $ve) {
            $jsonvehiculo = json_decode($ve['rutas_json']);
            foreach ($jsonvehiculo as $json) {
                if ($json->id ==  $id) {
                    $all_vehiculos[] = $ve;
                }
            }   
        }
        return $all_vehiculos;
    }
    public function all(){
        return Vehiculo::all();
    }
    /*
    * VALIDATIONS FORMS
    */
    public function validate_form($all){
        $validator = Validator::make($all,[
            'nombre' => 'required',
            'modelo' => 'required',
            'marca' => 'required',
            'color' => 'required',
            'rutas_json' => 'required',
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
                'rutas'=>Ruta::all()
            ]
        );
    }

    public function list_report(Request $request){
        if (!empty($request->get('searchfecha') )) {
            $stock = Stock_historia::whereDate('created_at', $request->get('searchfecha'))->get();
        }else{
            $stock = Stock_historia::all();
        }
        $table = Datatables::of($stock);
        $table->addColumn('action', function($row){
            return '';
        })->rawColumns(['action']);
        return $table->make(true);  
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
            $table = new Vehiculo();
            $all['rutas_json'] = json_encode($all['rutas_json']);
            $table->fill($all)->save();
            return response()->json(['success'=>'Vehiculo guardado con exito']);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {   
        $data = Vehiculo::with('productos')->find($id);
        return response()->json(
            [
                'data'=>$data,
                'rutas'=>Ruta::all()
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
            $table = Vehiculo::find($all['id']);
            $errors = array();
            $stock_vehiculo_actual = 0;
            $save = false;
            foreach ($all['inputs_stocks'] as $input) {


                $producto = Producto::find($input['id']);

                $stocks = Stock_vehiculo::where('vehiculos_id',$input['id_vehiculo'])->where('productos_id',$input['id'])->first();

                if (!empty($stocks)) {
                    if ($input['value'] == $stocks->stock_product) {
                        continue;
                    }
                    if ($input['value'] > $producto->stock) {
                        array_push($errors,'El  stock en '.$producto->nombre.' es menor al especificado');
                        continue;
                    }
                    if ($producto->stock == 0) {
                         array_push($errors,'El  stock en '.$producto->nombre.' es igual a 0 ');
                        continue;
                    }
                    if ($input['value'] > 0) {


                        $stock_vehiculo_actual = $stocks->stock_product+$input['value'];
                        $stocks->stock_product = $stock_vehiculo_actual;
                        $save = $stocks->save();
                    }   

                }else {
                   $stocks = new Stock_vehiculo();
                   $stocks->vehiculos_id = $input['id_vehiculo'];
                   $stocks->productos_id = $input['id'];
                   $stocks->stock_product = $input['value'];
                   $save = $stocks->save();
                }

                if ($save) {
                 
                    $producto->stock = $producto->stock - $input['value'];
                    $producto->save();

                    $stock_history = new Stock_historia();
                    $stock_history->vehiculo = $all['nombre'];
                    $stock_history->vehiculo_id = $input['id_vehiculo'];
                    $stock_history->producto = $producto->nombre;
                    $stock_history->producto_id = $producto->id;
                    $stock_history->stock_actual = $stock_vehiculo_actual;
                    $stock_history->save();
                }

            }
            if (count($errors) > 0) {
                return response()->json(['error'=>$errors],422);
            }
            $table->fill($all)->save();
            return response()->json(['success'=>'Vehiculo actualizado con exito']);
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
        $delete_find = Vehiculo::find($all['id_data']);
        if (!empty($delete_find)) {
            $delete_find->delete();
        }
    }
}
