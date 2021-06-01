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
			     	   				<b><i class="fas fa-car"></i>  <i class="fas fa-plus-square"></i>  Nuevo Registro</b>
			     	   			</div>
			     	   			<div class="col-6 text-right">
			     	   				<router-link  to="/vehiculos" class="text-white">
				                        <b><i class="fas fa-arrow-alt-circle-left"></i> Volver al listado..</b>
				                    </router-link>
			     	   			</div>
			     	   		</div>
			     	   </div>
		              <div class="card-body">
		              	  	<errors-form :errors="validationForm"/>
  							<success-message :message="message_success"/>

		              		<form  @submit.prevent="formsave" ref="formContainer">
		              			<input type="hidden" v-model="form.id">
		              			<div class="row">
		              				<div class="col-md-6 col-lg-3 col-xl-3">
		              					<label for=""><b>Nombre del Vehiculo:</b></label>
		              					<input type="text" class="form-control" v-model="form.nombre" placeholder="example: Vehiculo 2">
		              				</div>
		              				<div class="col-md-6 col-lg-3 col-xl-3">
		              					<label for=""><b>Modelo:</b></label>
		              					<input type="text" class="form-control" v-model="form.modelo" placeholder="example: Chevrolet">
		              				</div>
		              				<div class="col-md-6 col-lg-3 col-xl-3 mt-md-4  mt-xl-0">
		              					<label for=""><b>Marca:</b></label>
		              					<input type="text" class="form-control" v-model="form.marca" placeholder="example: Blazer">
		              				</div>
		              				<div class="col-md-6 col-lg-3 col-xl-3 mt-md-4  mt-xl-0">
		              					<label for=""><b>Color:</b></label>
		              					<input type="text" class="form-control" v-model="form.color" placeholder="example: Azul">
		              				</div>
		              			</div>
		              			<hr>
		              			<div class="row">
		              				<div class="col-12">
		              					<select  data-tipe="rutas"  class="form-control" @change="selects_change">
		              						<option value="">Seleccionar..</option>
		              						<option v-for="item in rutas" :value="item.id" :key="item.id" >{{ item.nombre }} || {{item.direccion}}</option>
		              					</select>
		              					<hr>
		              					<div class="row">
		              						<div class="col-12">
		              							<span v-for="item in form.rutas_json" :key="item.id" class="items_selected_json bg bg-primary">{{item.nombre}} | {{item.direccion}}
		              								<a href="#"  @click="selects_delete('rutas',item.id)" ><i class="fas fa-trash"></i></a>
		              							

		              							</span>
		              						</div>
		              					</div>
		              				</div>
		              			
		              			</div>
		              			<hr>
		              			<div class="row">
		              				<div class="col-12">
		              					<all-table :stockinputs="stocks_table" :editid="$route.params.id"></all-table>
		              				</div>
		              			</div>
		              			<div class="row mt-5">
		              				<div class="col-12 text-center">
		              					<button class="btn btn-primary"><i class="fas fa-save"></i> Guardar</button>
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
	import AllTable from '@/Pages/Vehiculos/AddVehiculoTable';
	import {mapGetters,mapActions} from 'vuex'

	export default {
		components: {
	      SectionContent,HeaderTitle,ErrorsForm,successMessage,AllTable
	    },
	    data: function() {
	    	return {
	    		url_table:route('vehiculos.index'),
	    		productos:null,
	    		rutas:null,
	    		validationForm:[],
	    		message_success:'',
	    		form:{
	    			id:null,
	    			nombre:'',
	    			modelo:'',
	    			marca:'',
	    			color:'',
	    			rutas_json:[],

	    		},
	    		inputs_stocks:[],
	    		stocks_table:[],
	    		fullPage: false
	    	}
	    },
  		created: function () {
  			this.init(this.$route.params.id);

	    },
	    computed:{
	    	...mapGetters(['allTodos'])
	    },
		mounted: function () {

	    },
	    methods:{
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
	    	init(payload){
	    		let me = this;
	    		
	    		axios.get(route('vehiculos.edit',{id:payload})).then((response) => {
	    			Object.keys(response.data.data).map(function(key, index) {
	    				if (key === 'rutas_json') {
	    					response.data.data[key]  = JSON.parse(response.data.data[key])
	    				}
	    				if (key === 'productos') {
	    					let productos = response.data.data[key];
	    					for (var i = 0; i < productos.length; i++) {

	    						me.stocks_table.push(productos[i]);
	    					}
	    				}

					});
					me.form = response.data.data
	    			me.rutas = response.data.rutas

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
	    	stocks_inputs(){
	    		let me = this;
	    		me.inputs_stocks = []
	    		$(`.stocks_inputs`).each(function(index, value) {
	    			if ($(this).val() !== '') {
						me.inputs_stocks.push({
							id:$(this).attr('data-id'),
							id_vehiculo:me.$route.params.id,
							value:$(this).val()
						});
					}
				});
				me.form.inputs_stocks = me.inputs_stocks
	    	},
	    	formsave(){
	    		let loader = this.loader();
	    		let me = this;
	    		this.message_success = ''

	    		this.stocks_inputs();

	    		axios.post(route('vehiculos.update'),this.form).then((response) => {
	    			me.validationForm = ''
	    		    me.message_success = response.data.success
	    		    loader.hide()
	    		    $('#table_id').DataTable().ajax.reload();

	    		}).catch((error) => {
	    			loader.hide()
	    			me.validationForm = ''
	    		  	if (error.response.status == 422){
	    		  		console.log(error.response.data)
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
	    	},
	    	beforeRouteUpdate(to, from, next) {
			    this.param = to.params.param;
			    next();
			},
	    	reload(){
		        $('#table_id').DataTable().ajax.reload();
		    },

	    },


	}
</script>