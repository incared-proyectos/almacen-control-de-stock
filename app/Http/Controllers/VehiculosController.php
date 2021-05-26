<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use App\Models\Vehiculo;
use App\Models\Producto;
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
            'productos_json' => 'required',
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
                'productos'=>Producto::all(),
                'rutas'=>Ruta::all()
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
            $table = new Vehiculo();
            $all['productos_json'] = json_encode($all['productos_json']);
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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
