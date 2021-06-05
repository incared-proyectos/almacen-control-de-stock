<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use App\Models\Producto;
use App\Models\Stock_vehiculo;
class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table = Datatables::of(Producto::all());
        $table->addColumn('action', function($row){
            return 'delete';
        })->addColumn('stock_vehicle', function($row){
            return 'stock';
        })->rawColumns(['action','stock_vehicle']);
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
        })->addColumn('stock_vehicle', function($row){
            return 'stock';
        })->rawColumns(['action','stock_vehicle']);
        return $table->make(true);    
    }
    /*
    * VALIDATIONS FORMS
    */
    public function validate_form($all){
        $validator = Validator::make($all,[
            'nombre' => 'required',
            'stock' => 'required',
            'precio' => 'required',
            'marca' => 'required',
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
        //
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
            $table = new Producto();
            $table->fill($all)->save();
            return response()->json(['success'=>'Producto guardado con exito']);
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
        //
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
            $table = Producto::find($all['id']);
            $table->fill($all)->save();
            return response()->json(['success'=>'Producto Actualizado con exito']);
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
        $table = Producto::find($all['id_data']);
        if ($table) {
            $table->delete();
        }

    }
}
