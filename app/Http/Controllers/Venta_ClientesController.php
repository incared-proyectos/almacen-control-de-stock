<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use App\Models\Venta_cliente;
use App\Models\Venta_clientes_linea;
use App\Models\Producto;
use App\Models\Vehiculo;
use App\Models\Stock_vehiculo;
use App\Models\Ruta;
use App\Models\Forma_de_pago;
use Mpdf;
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
        })->addColumn('actionpdf', function($row){
            return '';
        })->rawColumns(['action']);
        return $table->make(true);      
    }
    public function stocks_productos($id,Request $request)
    {
        $all = $request->all();
        //$producto = Producto::where('nombre', 'like', '%'.$all['search'].'%')->get();

        $vehiculos = Vehiculo::with(['productos' => function($query) use ($request) { 
           $query->where('productos.nombre','like', '%' . $request->search  . '%'); 
         }
        ])->where('id',$id)->first();
        
        $vehiculos->productos->map(function($item) use ($id) {
            $item->stock_actual = $item->pivot->stock_product;
            $item->stock_venta = 0;
            $item->producto_id = $item->id;
            $item->precio_total = 0;
            unset($item->pivot);
        });
        return $vehiculos->productos;
    }

    /*
    * VALIDATIONS FORMS
    */
    public function validate_form($all){
        $validator = Validator::make($all,[
            'fpago' => 'required',
            'codigo' => 'required',
            'fecha_venta' => 'required',
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
                'codigo'=>$this->generate_cod_venta(),
                'fpagos'=>Forma_de_pago::all(),
                'rutas'=> Ruta::all()
            ]
        );
    }
    public function generate_cod_venta(){
        $venta  = Venta_cliente::orderBy('id','DESC')->first();
        $codigo = sprintf("%08d",1);
        if (!empty($venta)) {
            if (!empty($venta->codigo)) {
                $exp = $venta->codigo;

                $codigo_result = sprintf("%00d", $exp);
                $codigo = $codigo_result+1;
                $codigo = sprintf("%08d", $codigo);
            }
        }
        return $codigo;
    }

    public function pdf_init($id){
        $factura = Venta_cliente::find($id);
        $factura_lineas = Venta_clientes_linea::where('venta_cliente_id',$factura->id)->get();

        $mpdf = new \Mpdf\Mpdf([
            'margin_left' => 6,
            'margin_right' => 6,
            'margin_top' => 35,
            'margin_bottom' => 10,
            'margin_header' => 5,
            'margin_footer' => 5,
            'mode' => 'utf-8', 
            'format' => 'A4',
            'orientation' => 'P'
        ]);
        $mpdf->SetProtection(array('print'));
        $mpdf->SetTitle("Factura PDF Ventas lineas");
        $mpdf->SetAuthor("Acme Trading Co.");
        $mpdf->SetWatermarkText("");   // anulada
        $mpdf->showWatermarkText = true;
        $mpdf->watermark_font = 'DejaVuSansCondensed';
        $mpdf->watermarkTextAlpha = 0.1;
        $mpdf->SetDisplayMode('fullpage');
        $mpdf->WriteHTML(view('export_pdf.factura',['factura'=>$factura,'lineas'=>$factura_lineas]));
        $mpdf->Output('factura_'.$factura->id.'.pdf', 'I');
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
                    $table_lineas->precio_total = $lineas['precio_total'];
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
    public function ventas_lineas(Request $request,$id)
    {
        $all = $request->all();
        $table = Venta_clientes_linea::where('venta_cliente_id',$id)->get();

        $table->map(function($item) use ($id) {
            $ventas = Venta_cliente::find($id);
            $vehiculo = Stock_vehiculo::where('vehiculos_id',$ventas->vehiculo_id)->where('productos_id',$item->producto_id)->first();
            if (empty($vehiculo)) {
                return 0;
            }
            $item->stock_actual = $vehiculo->stock_product;
            $item->id_linea = $item->id;

            $producto = Producto::where('id',$item->producto_id)->first();
            $item->stock = (!empty($producto)) ? $producto->stock : 0;
            /*
            $item->stock_venta = 0;
            $item->producto_id = $item->id;
            $item->precio_total = 0;*/

        });

        return $table;



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
                    $lineas['id_linea'] = (isset($lineas['id_linea'])) ? $lineas['id_linea'] : 0;
                    $table_lineas = Venta_clientes_linea::where('id',$lineas['id_linea'])->first();
                    if (!empty($table_lineas)) {                  
                        $table_lineas->nombre = $lineas['nombre'];
                        $table_lineas->stock_venta = $lineas['stock_venta'];
                        $table_lineas->precio = $lineas['precio'];
   
                        $table_lineas->precio_total = $lineas['precio_total'];
                      
                        $table_lineas->save();
                    }else{

                        $table_lineas = new Venta_clientes_linea();
                        $table_lineas->nombre = $lineas['nombre'];
                        $table_lineas->stock_venta = $lineas['stock_venta'];
                        $table_lineas->precio = $lineas['precio'];
                        $table_lineas->producto_id = $lineas['producto_id'];
                        $table_lineas->precio_total = $lineas['precio_total'];
                        $table_lineas->venta_cliente_id = $all['id'];
                        $table_lineas->save();
                    }
                    $stock_vehiculos->stock_product =  $lineas['stock_actual'];
                    $stock_vehiculos->save();
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
