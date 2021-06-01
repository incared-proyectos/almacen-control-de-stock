<template>
	<div>
		<section-content>
		    <!-- Main row -->
		    <div class="row">
		    	<div class="col-12">
			     	<div class="card">
			     	   <div class="card-header bg bg-info">
			     	   		<div class="row">
			     	   			<div class="col-6">
			     	   				<b><i class="fas fa-car"></i>  <i class="fas fa-plus-square"></i>  Nueva Venta</b>
			     	   			</div>
			     	   			<div class="col-6 text-right">
			     	   				<router-link  to="/ventas_clientes" class="text-white">
				                        <b><i class="fas fa-arrow-alt-circle-left"></i> Volver al listado..</b>
				                    </router-link>
			     	   			</div>
			     	   		</div>
			     	   </div>
		              <div class="card-body">
		              	  	<errors-form :errors="validationForm"/>
  							<success-message :message="message_success"/>

							{{alerts}}
		              		<form  @submit.prevent="formsave" ref="formContainer">
		              			<div class="row">
		              				<div class="col-6">
		              					
		              				</div>
		              				<div class="col-6 text-right">
		              					<div class="row">
		              						<div class="col-4">
		              							<div class="input-group mb-3">
												    <div class="input-group-prepend">
												      <span class="input-group-text text-uppercase"><b>F.Pagos</b></span>
												    </div>
												   	<select class="form-control text-uppercase" v-model="form.fpago" >
												   		<option value="">Seleccionar..</option>
												   		<option v-for="item in fpagos" :value="item.cod" class="text-uppercase"> {{item.nombre}}</option>
												   	</select>
												</div>
		              						</div>
		              						<div class="col-4">
		              							<div class="input-group mb-3">
												    <div class="input-group-prepend">
												      <span class="input-group-text text-uppercase"><b>Codigo</b></span>
												    </div>
												    <input type="text" class="form-control" placeholder="example:006798797" v-model="form.codigo">
												</div>
		              						</div>
		              						<div class="col-4">
		              							<div class="input-group mb-3">
												    <div class="input-group-prepend">
												      <span class="input-group-text text-uppercase"><b>Fecha</b></span>
												    </div>
												    <input type="text" class="form-control" placeholder="example:10/20/2020" v-model="form.created_at">
												</div>
		              						</div>
		              					</div>
		              				</div>
		              			</div>
		              			<hr>
		              			<div class="row">
		              				<div class="col-12">
		              					<h4 class="text-uppercase"><i class="fas fa-shopping-cart"></i> DATOS CLIENTE</h4>
		              				</div>
		              			</div>
		              			<hr>
		              			<div class="row">
		              				<div class="col-3">
			              				<div class="input-group ">
										    <div class="input-group-prepend">
										      <span class="input-group-text"><b>DNI</b></span>
										    </div>
										    <input type="text" class="form-control" placeholder="BUSCAR DNI" @keyup="dni_search"  v-model="form.cifnif">
										  
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
										    <input type="text" class="form-control" placeholder="NOMBRES..." v-model="form.nombres">
										 </div>
		              				</div>
		              				<div class="col-3">
			              				<div class="input-group mb-3">
										    <div class="input-group-prepend">
										      <span class="input-group-text text-uppercase"><b>Apellidos</b></span>
										    </div>
										    <input type="text" class="form-control" placeholder="APELLIDOS..." v-model="form.apellidos">
										 </div>
		              				</div>
		              				<div class="col-3">
			              				<div class="input-group mb-3">
										    <div class="input-group-prepend">
										      <span class="input-group-text text-uppercase"><b>Telefono</b></span>
										    </div>
										    <input type="text" class="form-control" placeholder="example:+5764678978789" v-model="form.telefono">
										</div>
		              				</div>
		              			</div>
		              			<div class="row mt-2">
		              				<div class="col-6">
		              					<span v-for="item in ruta_cliente" :key="item.id" class="items_selected_json bg bg-primary">
		              						{{item.nombre}} | {{item.direccion}}
              							</span>
		              				</div>
		              			</div>
		              			<div class="vehiculos_form" v-if="vehiculos_ruta.length > 0">
			              			<hr>
			              			<div class="row">
			              				<div class="col-12">
			              					<h4 class="text-uppercase"><i class="fas fa-truck"></i> Vehiculos</h4>
			              				</div>
			              			</div>
			              			<hr>
			              			<div class="row">
			              				<div class="col-12">
			              					<table class="table table-bordered">
											  <thead>
											    <tr>
											      <th scope="col">#</th>
											      <th scope="col">Nombre</th>
											      <th scope="col">Modelo</th>
											      <th scope="col">Marca</th>
											      <th scope="col">Action</th>
											    </tr>
											  </thead>
											  <tbody>
											  	<tr v-for="item in vehiculos_ruta">
											  		<td>{{item.id}}</td>
											  		<td>{{item.nombre}}</td>
											  		<td>{{item.modelo}}</td>
											  		<td>{{item.marca}}</td>
											  		<td>
											  			<a href="#" class="btn btn-success btn-sm" @click="selectvehicle(item.id)"><i class="fas fa-check-double"></i> Elegir</a>
											  		</td>
											  	</tr>
											  </tbody>
											</table>
			              				</div>
			              			</div>	
		              			</div>
		              			<div class="productos_table" v-if="route_datatable !== null">
		              				<hr>
			              			<div class="row">
			              				<div class="col-9">
			              					<h4 class="text-uppercase"><i class="fas fa-store"></i> Productos</h4>
			              				</div>
			              				<div class="col-3 " >
			              					<div class="alert alert-info mb-0 " v-if="selected_vehiculo !== ''">
			              						<span ><b>Vehiculo seleccionado:</b> {{selected_vehiculo}}</span>
			              					</div>
			              				</div>
			              			</div>
			              			<hr>
			              			<div class="row">
			              				<div class="col-12">
			              					<all-table v-if="route_datatable !== null" casetable="create" :route="route_datatable" ></all-table>
			              				</div>
			              			</div>
		              			</div>

		              			<div class="row mt-2">
		              				<div class="col-12 text-center">
		              					<button class="btn btn-primary" :disabled="buttonsBlock">Guardar</button>
		              				</div>
		              			</div>
		              		</form>
		              </div>
		            </div>
		     	</div>
		    </div>
		    <!-- /.row (main row) -->
		</section-content>

	</div>
</template>
<script>
	import SectionContent from "@/components/SectionContent.vue"
	import HeaderTitle from "@/components/HeaderTitle.vue"
	import ErrorsForm from "@/components/ValidationErrors.vue"
	import successMessage from '@/components/SuccessMessage';
	import AllTable from '@/Pages/Ventas_clientes/AddVehiculoTable';

	export default {
		components: {
	      SectionContent,HeaderTitle,ErrorsForm,successMessage,AllTable
	    },
	    data: function() {
	    	return {
	    		route_datatable:null,
	    		rutas:null,
	    		validationForm:[],
	    		clientes_search:[],
	    		ruta_cliente:[],
	    		vehiculos_ruta:[],
	    		fpagos:[],
	    		selected_vehiculo:'',
	    		message_success:'',	

	    		form:{
	    			codigo:'',
	    			nombres:'',
	    			direccion:'',
	    			cifnif:'',
	    			apellidos:'',
	    			telefono:'',
	    			fpago:'',
	    			created_at:'',
	    			vehiculo_id:null,
	    			ruta_id:null,
	    			ventas_lineas:[],
	    		

	    		},
	    		fullPage: false
	    	}
	    },
  		created: function () {
  			this.init();
  			
	    },
		mounted: function () {

	    },
	    computed:{
	    	alerts(){
	    		let error = this.$store.getters.errorsInput.length;
	    		if (error > 0) {
	    			let errors = this.$store.getters.errorsInput;
					swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: errors[0].error,
					})
	    		}
	    	},
	    	buttonsBlock(){
	    		return  this.$store.getters.errorsInput.length > 0 ? true : false;
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
	    	selectvehicle(id_select){
	    		//AGREGAMOS LA RUTA PARA MOSTRAR LA TABLA ES DECIR LA RUTA DE CONSULTA PARA NUESTRO DATA-TABLE
	    		this.route_datatable = route('ventas_clientes.stocks_productos',{id:id_select})
	    		//--------------------------------------------------------------------------------------------

	    		let vehiculo_selected = this.vehiculos_ruta.find(item => item.id === id_select)
	    		this.selected_vehiculo = vehiculo_selected.nombre

	    		//Obtenemos el id del vehiculo para guardarlo en la base de datos
	    		this.form.vehiculo_id = vehiculo_selected.id
	    		this.vehiculos_ruta = [];
	    	},
	    	select_search(id_select){
	    		let item = this.clientes_search.find(item => item.id === id_select)
	    		let me = this
	    		this.ruta_cliente = [];

	    		this.route_datatable = null

	    		//DATOS QUE NECESITAREMOS A LA HORA DE GUARDAR 
	    		this.form.cifnif = item.identificacion
	    		this.form.nombres = item.nombres
	    		this.form.apellidos = item.apellidos
	    		this.form.telefono = item.telefono
	    		this.form.ruta_id = item.ruta.id
	    		this.form.direccion = item.ruta.nombre
	    		//--------------------------------------------

	    		this.ruta_cliente.push(item.ruta); //OBTENEMOS LA RUTA DEL CLIENTE Y LA MOSTRAMOS COMO INFORMACION 

	    		//OBTENEMOS TODOS LOS VEHICULOS QUE ESTEN ASOCIADOS AL SIGUIENTE ID, ES DECIR AL ID  DE LA RUTA DE ESTA FORMA BUSCAMOS LOS VEHICULOS ASOCIADOS A ESE ID
	    		axios.get(route('vehiculos.getby',{id:item.ruta.id})).then((response) => {
	    			me.vehiculos_ruta = response.data
	    		}).catch((error) => {
			       	alert(error.response.data.message)
	    		})
	    		this.clientes_search = []
	    	},

	    	clearform(){
        		let me = this;
        		Object.keys(this.form).forEach(function(key) {
        		  if (Array.isArray(me.form[key]) ) {
        		  	me.form[key] = []
        		  }else{
				  	me.form[key] = '';
				  }
				})
				me.ruta_cliente = []
				me.route_datatable = null
        	},
	    	init(){
	    		let me = this;
	    		axios.get(route('ventas_clientes.create')).then((response) => {
	    			me.rutas = response.data.rutas
	    			me.fpagos = response.data.fpagos
	    		}).catch((error) => {
			       	alert(error.response.data.message)
	    		})
	    	},
	    	loader(){
	    		return this.$loading.show({
                  // Optional parameters
                  container: this.fullPage ? null : this.$refs.formContainer,
                  canCancel: false,
                  onCancel: this.onCancel,
                });
	    	},
	    	formsave(){
	    		let loader = this.loader();
	    		let me = this;
	    		me.message_success = ''

	    		//OBTENEMOS LAS LINEAS DE LAS VENTAS MEDIANTE VUEX Y LA MODIFICACION DEL ARRAY 
	    		me.form.ventas_lineas = this.$store.getters.itemsModify
	    		me.form.total_precio = this.$store.getters.precioTotal
	    		//----------------------------------------------------------------------------
	    		axios.post(route('ventas_clientes.save'),this.form).then((response) => {
	    			me.validationForm = ''
	    			me.clearform()
	    		    me.message_success = response.data.success
	    		    loader.hide()
	    		}).catch((error) => {
	    			loader.hide()
	    			me.validationForm = ''
	    		  	if (error.response.status == 422){
			    		me.validationForm = error.response.data;
			      	}else if (error.response.status == 500) {
			        	alert(error.response.data.message)
			      	}
	    		})
	    	}
	    	

	    },


	}
</script>