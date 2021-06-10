   <html>
        <head>
        <meta charset="UTF-8">
            <style>

                body {font-family: sans-serif;
                 font-size: 10pt;
                 color:#444444;
             }
             p {    margin: 0pt; }
             table.items {
                 border: 0.1mm solid #000000;
             }
             td { vertical-align: top; }
             .items td {
                 border-left: 0.1mm solid #000000;
                 border-right: 0.1mm solid #000000;
             }
             table thead td { background-color: #acacac;
                 text-align: center;
                 border: 0.1mm solid #000000;
                 font-variant: small-caps;
             }
             .items td.blanktotal {
                 background-color: #acacac;
                 border: 0.1mm solid #000000;
                 background-color: #FFFFFF;
                 border: 0mm none #000000;
                 border-top: 0.1mm solid #000000;
                 border-right: 0.1mm solid #000000;
             }
             .items td.totals {
                 text-align: right;
                 border: 0.1mm solid #000000;

             }
             .items td.cost {
                 text-align: "." center;
             }


             .container-info{
                border: 1.7px solid #4a4a4a;  width: 100%; height:80px;margin-top: 6px;
            }
            .caja-one{
                float: left;  width:69%;   height: 80px; 
            }
            .caja-two{
                float:right; width: 30.6%;border-left:1.7px solid #4a4a4a;  height: 80px;
            }
            .cont-header { *display: inline-block; }
            * html .cont-header { height: 1%; }
            .cont-header:after { content: "."; display: block; height: 0; clear: both; visibility: hidden; font-size: 0; }

        </style>
        </head>
        <body>
            <!--mpdf
            <htmlpageheader name="myheader">

            <div class="cont-header">


             <div class="caja-info" style="float:left; width:67%;  height:115px;">
              <div class="my-img" >
              
               <img src="{{asset('img/company.jpg')}}" align="left" style="width:100%;  float:top; height: 110px;">
         

        </div>


        </div> 
        <div class="caja-info" style="float:right; width:30%; border:2.5px solid  #0069D9 ; height:50px;  text-align: center;border-radius:5px;">
           <h4 style="line-height: 10px;"><code>cifnif: {{$factura->cifnif}}</code></h4>
        </div>
        </div>
        <br>
        </htmlpageheader>
        <htmlpagefooter name="myfooter">

        <div>
          

        </div>
        <div style="border-top: 1px solid #000000; font-size: 9pt; text-align: center; padding-top: 3mm; ">
        <p style="text-align:center; margin_bottom:5px;">Ventas facturas clientes</p>
        <p style="text-align:right;">Pag {PAGENO} of {nb}</p>
        </div>
        </htmlpagefooter>


        <sethtmlpageheader name="myheader" value="on" show-this-page="1" />
        <sethtmlpagefooter name="myfooter" value="on" />
        mpdf-->

        <!--este es el contenedor donde se encuentra toda la informacion
        correspondiente del cliente-->
        <div class="container-info">
        	<div class="caja-one" >
        		<table  style="font-family: serif;" cellpadding="1" border="0" style="font-size: 8pt; border-collapse: collapse; " cellpadding="2">
        				<tr>
        					<td style="line-height: 0px;"><b>Señor(es)</b></td>
        					<td style="line-height: 0px; "><b>:</b> {{$factura->nombres}} </td>
        				</tr>
        				<tr>
        					<td style="line-height: 0px;"><b>Direccion</b></td>
        					<td style="line-height: 0px;"><b>:</b> {{$factura->direccion}}</td>
        				</tr>
        				<tr>
        					<td style="line-height: 0px;"><b>Fecha Emi</b></td>
        					<td style="line-height: 0px;"><b>:</b> {{$factura->fecha_venta}}</td>
        				</tr>
        				<tr>
        					<td style="line-height: 0px;"><b>Cifnif</b></td>
        					<td style="line-height: 0px;"><b>:</b> {{$factura->cifnif}}</td>
        				</tr>
        			</table>
        	</div>
        		
        </div>




        <!--#####################Fin de la caja de informacion del cliente###################################-->
        <br />
        <table class="items" width="100%" style="font-size: 8pt; border-collapse: collapse; " cellpadding="2">
        <thead>
        <tr>
        <td width="4%"><b>IT</b></td>
        <td width="5%"><b>NOMBRE</b></td>
        <td width="10%"><b>CANTIDAD</td>

        <td width="13%"><b>P. UNIT</b></td>
        <td width="10%"><b>P. VENTA</b></td>
        </tr>
        </thead>
        <tbody>
        <!-- ITEMS HERE -->
        @foreach($lineas as $l)
    
        	<tr>
	        	<td align="center">{{$l->id}}</td>
                <td align="center">{{$l->nombre}}</td>

	        	<td align="center">{{$l->stock_venta}}</td>
	        	<td class="cost" align="right">{{$l->precio}}</td>
	        	<td class="cost" align="right">{{$l->precio_total}}</td>
        	</tr>
        
        @endforeach
 
        <!-- END ITEMS HERE -->

        <tr style="background-color:#dbd9d9;">


       
        </tr>

 

 
        <tr style="background-color:#acacac;">
        <td colspan="3"></td>
        <td class="totals"><b>TOTAL </b></td>
        <td class="totals cost" align="right"  ><b>{{$factura->total_precio}}</b></td>
        </tr>
        </tbody>
        </table>
        <div style="text-align: center; font-style: italic;"></div>
        </body>
        </html>
        