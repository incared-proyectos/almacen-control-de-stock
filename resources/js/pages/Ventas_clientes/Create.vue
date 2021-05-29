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

					
		              		<form  @submit.prevent="formsave" ref="formContainer">
		              			<div class="row">
		              				<div class="col-6">
		              					
		              				</div>
		              				<div class="col-6 text-right">
		              					<div class="row">
		              						<div class="col-6">
		              							<div class="input-group mb-3">
												    <div class="input-group-prepend">
												      <span class="input-group-text text-uppercase"><b>Codigo</b></span>
												    </div>
												    <input type="text" class="form-control" placeholder="example:006798797">
												</div>
		              						</div>
		              						<div class="col-6">
		              							<div class="input-group mb-3">
												    <div class="input-group-prepend">
												      <span class="input-group-text text-uppercase"><b>Fecha</b></span>
												    </div>
												    <input type="text" class="form-control" placeholder="example:10/20/2020">
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
										    <input type="text" class="form-control" placeholder="BUSCAR DNI" @keyup="dni_search" v-model="form.identificacion">
										  
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
		              			<div class="productos_table" v-if="idselect !== null">
		              				<hr>
			              			<div class="row">
			              				<div class="col-12">
			              					<h4 class="text-uppercase"><i class="fas fa-store"></i> Productos</h4>
			              				</div>
			              			</div>
			              			<hr>
			              			<div class="row">
			              				<div class="col-12">
			              					<all-table v-if="idselect !== null" :idselected="idselect" ></all-table>
			              				</div>
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
	    		url_table:route('vehiculos.index'),
	    		rutas:null,
	    		validationForm:[],
	    		clientes_search:[],
	    		ruta_cliente:[],
	    		vehiculos_ruta:[],
	    		idselect:null,
	    		message_success:'',	

	    		form:{
	    			identificacion:'',
	    			nombres:'',
	    			apellidos:'',
	    			telefono:'',
	    		},
	    		fullPage: false
	    	}
	    },
  		created: function () {
  			this.init();
	    },
		mounted: function () {

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

	    		this.idselect = id_select;
	    		this.vehiculos_ruta = [];
	    	},
	    	select_search(id_select){
	    		let item = this.clientes_search.find(item => item.id === id_select)
	    		let me = this
	    		this.ruta_cliente = [];
	    		this.idselect = null
	    		this.form.identificacion = item.identificacion
	    		this.form.nombres = item.nombres
	    		this.form.apellidos = item.apellidos
	    		this.form.telefono = item.telefono

	    		this.ruta_cliente.push(item.ruta);
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
        	},
	    	init(){
	    		let me = this;
	    		axios.get(route('rutas.all')).then((response) => {
	    			me.rutas = response.data
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
	    		this.message_success = ''

	    		axios.post(route('vehiculos.save'),this.form).then((response) => {
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
	    	},	
	    	selects_change(event){
	    		let select = $(event.currentTarget);
	    		if (select.val() !== '') {
	    			let selected_id = Number(select.val());

		    		if (select.attr('data-tipe') == 'rutas') {
		    			if (this.form.rutas_json.find(item => item.id === selected_id) !== undefined) {
		    				return;
		    			}
		    			let item = this.rutas.find(item => item.id === selected_id)

		    			this.form.rutas_json.push(item)
		    		}
	    		}
	    	},
	    	selects_delete(type,payload){
	    		
	    		if (type == 'rutas') {
	    			this.form.rutas_json = this.form.rutas_json.filter(item => item.id !== payload) // con filter hacemos de este modo buscamos el id donde sea diferente al payload o al id que le pasamos y asi borra el elemento
	    		}
	    	}

	    },


	}
</script>