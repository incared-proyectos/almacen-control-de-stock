<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use App\Models\Cliente;
use App\Models\Ruta;
class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table = Datatables::of(Cliente::all());
        $table->addColumn('action', function($row){
            return '';
        })->rawColumns(['action']);
        return $table->make(true);      
    }

    public function search(Request $request){
        $all = $request->all();
        //search by like
        $search = Cliente::where('identificacion', 'like', '%'.$all['search'].'%')->with('ruta')->get();
        return $search;
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return Ruta::all();
    }
      /*
    * VALIDATIONS FORMS
    */
    public function validate_form($all){
        $validator = Validator::make($all,[
            'nombres' => 'required',
            'apellidos' => 'required',
            'identificacion' => 'required',
            'direccion' => 'required',
            'ruta_id' => 'required',
        ]);
        return $validator;
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
            $table = new Cliente();
            if (Cliente::where('email',$all['email'])->count() > 0) {
                return response()->json(['error'=>array('El correo '.$all['email'].' ya existe')],422);
            }
            if (Cliente::where('identificacion',$all['identificacion'])->count() > 0) {
                return response()->json(['error'=>array('La identificacion '.$all['identificacion'].' ya existe')],422);
            }
            $table->fill($all)->save();
            return response()->json(['success'=>'Cliente guardado con exito']);
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
        return response()->json(
            [
                'rutas'=>Ruta::all(),
                'cliente'=>Cliente::find($id)
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
            $table = Cliente::find($all['id']);
            if (Cliente::where('email',$all['email'])->where('id','!=',$all['id'])->count() > 0) {
                return response()->json(['error'=>array('El correo '.$all['email'].' ya existe')],422);
            }
            if (Cliente::where('identificacion',$all['identificacion'])->where('id','!=',$all['id'])->count() > 0) {
                return response()->json(['error'=>array('La identificacion '.$all['identificacion'].' ya existe')],422);
            }
            $table->fill($all)->save();
            return response()->json(['success'=>'Cliente actualizado con exito']);
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
        $table = Cliente::find($all['id_data']);
        if ($table) {
            $table->delete();
        }

    }
}
