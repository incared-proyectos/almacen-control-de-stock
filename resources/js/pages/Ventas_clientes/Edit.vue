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
		              			<form-header 
		              				:fpagos="fpagos" 
		              				:rutas="rutas" 
		              				:form="form"
		              				:routeapi="route_search"
		              				:createsearch="clientes_search"
		              				:rutacliente="ruta_cliente"
		              				disabledsearch="1"
		              				
    								@fpago="form.fpago = $event"
    								@codigo="form.codigo = $event"
    								@createdat="form.fecha_venta = $event"
    								@cifnif="form.cifnif = $event"
    								@nombres="form.nombres = $event"
    								@apellidos="form.apellidos = $event"
    								@telefono="form.telefono = $event"
    								@vehiculoid="form.vehiculo_id = $event"
    								@rutaid="form.ruta_id = $event"
    								@vehiculosruta="vehiculos_ruta = $event"
    								@routeapi="route_search = $event"
    								@rutacliente="ruta_cliente = $event"

		              				>

		              			</form-header>
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
		              			<div class="productos_table" v-if="route_search !== null">
		              				<hr>
			              			<div class="row">
			              				<div class="col-3 " >
			              					<div class="alert alert-info mb-0 " v-if="selected_vehiculo !== ''">
			              						<span ><b>Vehiculo seleccionado:</b> {{selected_vehiculo}}</span>
			              					</div>
			              				</div>
			              			</div>
			              			<hr>
			              			<div class="row">
			              				<div class="col-12">
			              					<all-table v-if="route_search !== null"  
			              					casetable="update"  
			              					:productos="productos" 
			              					:route="route_init"  
			              					:routesearch="route_search"></all-table>
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
	import FormHeader from '@/Pages/Ventas_clientes/FormHeader';

	export default {
		components: {
	      SectionContent,HeaderTitle,ErrorsForm,successMessage,AllTable,FormHeader
	    },
	    data: function() {
	    	return {
	    		route_init:null,
	    		route_search:null,
	    		rutas:null,
	    		productos:'init',
	    		validationForm:[],
	    		clientes_search:[],
	    		ruta_cliente:[],
	    		vehiculos_ruta:[],
	    		fpagos:[],
	    		selected_vehiculo:'',
	    		message_success:'',	
	    		form:{
	    			id:null,
	    			codigo:'',
	    			nombres:'',
	    			direccion:'',
	    			cifnif:'',
	    			apellidos:'',
	    			telefono:'',
	    			fpago:'',
	    			created_at:'',
	    		},
	    		fullPage: false
	    	}
	    },
  		created: function () {
  			this.init();
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
	    	selectvehicle(id_select){

	    		this.route_search = route('ventas_clientes.stocks_productos',{id:id_select});
	    		this.productos = null;

	    		let vehiculo_selected = this.vehiculos_ruta.find(item => item.id === id_select)
	    		this.selected_vehiculo = vehiculo_selected.nombre

	    		//Obtenemos el id del vehiculo para guardarlo en la base de datos
	    		this.form.vehiculo_id = vehiculo_selected.id
	    		this.vehiculos_ruta = [];
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
	    		axios.get(route('ventas_clientes.edit',{id:this.$route.params.id})).then((response) => {
	    			me.rutas = response.data.rutas
	    			me.fpagos = response.data.fpagos
	    			me.ruta_cliente.push(response.data.data.ruta)

	    			me.route_init = route('ventas_clientes.ventas_lineas',{id:response.data.data.id})
	    			me.route_search = route('ventas_clientes.stocks_productos',{id:response.data.data.vehiculo_id})
	    			me.selected_vehiculo = response.data.data.vehiculo.nombre
	    			me.form = response.data.data

	    			console.log(response.data.data);
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
	    		axios.post(route('ventas_clientes.update'),this.form).then((response) => {
	    			me.validationForm = ''
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