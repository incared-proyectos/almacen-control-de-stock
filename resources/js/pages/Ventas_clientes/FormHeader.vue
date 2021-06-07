<template>
	<div>
		<div class="row">
			<div class="col-6">
				<h4 class="text-uppercase"><i class="fas fa-shopping-cart"></i> DATOS CLIENTE</h4>
			</div>
			<div class="col-6 text-right">
				<input type="hidden" :value="form.ruta_id"  @input="$emit('rutaid', $event.target.value)" >
				<input type="hidden" :value="form.vehiculo_id" @input="$emit('vehiculoid', $event.target.value)" >
				<div class="row">
					<div class="col-4">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text text-uppercase"><b>F.Pagos</b></span>
						    </div>
						   	<select class="form-control text-uppercase"  @input="$emit('fpago', $event.target.value)"   >
						   		<option value="">Seleccionar..</option>
						   		<option v-for="item in fpagos" 
						   		:value="item.cod " 
						   		:selected="item.cod == form.fpago"
						   		class="text-uppercase"> {{item.nombre}}</option>
						   	</select>
						</div>
					</div>
					<div class="col-4">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text text-uppercase"><b>Codigo</b></span>
						    </div>
						    <input type="text" class="form-control" placeholder="example:006798797" :value="form.codigo" @input="$emit('codigo', $event.target.value)" readonly="" >
						</div>
					</div>
					<div class="col-4">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text text-uppercase"><b>Fecha</b></span>
						    </div>
						    <input type="text" class="form-control" id="datepicker" placeholder="example:10/20/2020" :value="form.fecha_venta" @input="$emit('createdat', $event.target.value)" >
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-3">
				<div class="input-group ">
			    <div class="input-group-prepend">
			      <span class="input-group-text"><b>DNI</b></span>
			    </div>

			  
			    <template v-if="disableform == false">
			    	<input type="text" class="form-control" placeholder="BUSCAR DNI" @keyup="dni_search"  :value="form.cifnif" @input="$emit('cifnif', $event.target.value)"  >
			    </template>
			    <template v-else>
			    	<input type="text" class="form-control" placeholder="BUSCAR DNI" :value="form.cifnif" @input="$emit('cifnif', $event.target.value)" :readonly="disableform" >
			    </template>

		

			  
			</div>
			
			<div class="search_dni">
		    	<ul class="search_ul">
		    		<li class="search_li" v-for="item in clientes_search" :key="item.id" @click="select_search(item.id)"><i class="fas fa-address-card"></i> {{item.nombres}} || {{item.apellidos}}</li>
		    	</ul>
		    </div>
			</div>
			<div class="col-3">
				<div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text text-uppercase"><b>Nombres</b></span>
			    </div>
			    <input type="text" class="form-control" placeholder="NOMBRES..."  :value="form.nombres" @input="$emit('nombres', $event.target.value)">
			 </div>
			</div>
			<div class="col-3">
				<div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text text-uppercase"><b>Apellidos</b></span>
			    </div>
			    <input type="text" class="form-control" placeholder="APELLIDOS..."  :value="form.apellidos" @input="$emit('apellidos', $event.target.value)">
			 </div>
			</div>
			<div class="col-3">
				<div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text text-uppercase"><b>Telefono</b></span>
			    </div>
			    <input type="text" class="form-control" placeholder="example:+5764678978789" :value="form.telefono" @input="$emit('telefono', $event.target.value)">
			</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-6">
				<span v-for="item in rutaclienteC" :key="item.id" class="items_selected_json bg bg-primary">
					{{item.nombre}} | {{item.direccion}}
				</span>
			</div>
		</div>
	</div>
</template>
<script>
	export default {
		props:['rutas','fpagos','form','routeapi','createsearch','rutacliente','formsubmit','disabledsearch'],

		data: function() {
			return {
				ruta_cliente:[],
				clientes_search:[],
			}

		},
		created(){
			this.form.fecha_venta = moment().format('YYYY/MM/DD')
			 $(function () {
		        $('#datepicker').datepicker({

		            format: 'yyyy/mm/dd',
		            weekStart: 1,
		            daysOfWeekHighlighted: "6,0",
		            autoclose: true,
		            todayHighlight: true,
		        });
		      })
		},
		computed:{
			rutaclienteC(){
				if (this.formsubmit === 'created') {
					return [];
				}
				return this.rutacliente.length > 0 ? this.rutacliente : this.ruta_cliente
			},
			disableform(){

				return this.disabledsearch == 1 ? true : false;
			}
		},
		methods:{
			dni_search(event){
	    		let search = $(event.currentTarget).val();
	    		let me = this;
	    		axios.post(route('clientes.search'), {
	    		  	search
	    		}).then((response) => {
	    		  me.clientes_search = response.data

	    		}).catch((error) => {
	    		  console.error(error);
	    		});
	    	},
	    	
	    	select_search(id_select){
	    		let item = this.clientes_search.find(item => item.id === id_select)
	    		let me = this
	    		this.ruta_cliente = [];

	    		this.route_datatable = null
	    		this.$emit('routeapi',null)
	    		//DATOS QUE NECESITAREMOS A LA HORA DE GUARDAR 
	    		this.form.cifnif = item.identificacion
	    		this.form.nombres = item.nombres
	    		this.form.apellidos = item.apellidos
	    		this.form.telefono = item.telefono
	    		this.form.ruta_id = item.ruta.id
	    		this.form.direccion = item.ruta.nombre
	    		//--------------------------------------------
	    		this.ruta_cliente.push(item.ruta); //OBTENEMOS LA RUTA DEL CLIENTE Y LA MOSTRAMOS COMO INFORMACION 

	    		this.$emit('rutacliente',item.ruta)

	    		//OBTENEMOS TODOS LOS VEHICULOS QUE ESTEN ASOCIADOS AL SIGUIENTE ID, ES DECIR AL ID  DE LA RUTA DE ESTA FORMA BUSCAMOS LOS VEHICULOS ASOCIADOS A ESE ID
	    		axios.get(route('vehiculos.getby',{id:item.ruta.id})).then((response) => {
	    			me.vehiculos_ruta = response.data
	    			me.$emit('vehiculosruta',response.data)
	    		}).catch((error) => {
			       	alert(error.response.data.message)
	    		})
	    		this.clientes_search = []
	    	},
		}
	}

</script>