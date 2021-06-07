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
			     	   				<router-link  to="/clientes" class="text-white">
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
		              				<div class="col-md-6 col-lg-3 col-xl-3">
		              					<label for=""><b>Nombres:</b></label>
		              					<input type="text" class="form-control" v-model="form.nombres" placeholder="Escribe tu nombre">
		              				</div>
		              				<div class="col-md-6 col-lg-3 col-xl-3">
		              					<label for=""><b>Apellidos:</b></label>
		              					<input type="text" class="form-control" v-model="form.apellidos" placeholder="Escribe tu Apellido">
		              				</div>
		              				<div class="col-md-6 col-lg-3 col-xl-3 mt-md-4  mt-xl-0">
		              					<label for=""><b>Cifnif:</b></label>
		              					<input type="text" class="form-control" v-model="form.identificacion" placeholder="Escribe tu identificacion">
		              				</div>
		              				<div class="col-md-6 col-lg-3 col-xl-3 mt-md-4  mt-xl-0">
		              					<label for=""><b>Telefono:</b></label>
		              					<input type="text" class="form-control" v-model="form.telefono" placeholder="example:569874464897">
		              				</div>
		              			
		              			</div>
		              			<hr>
		              			<div class="row">
		              				<div class="col-md-6 col-lg-3 col-xl-3 mt-md-4  mt-xl-0">
		              					<label for=""><b>Email:</b></label>
		              					<input type="text" class="form-control" v-model="form.email" placeholder="example@gmail.com">
		              				</div>
		              				<div class="col-md-6 col-lg-3 col-xl-3 mt-md-4  mt-xl-0">
		              					<label for=""><b>direccion:</b></label>
		              					<textarea v-model="form.direccion" class="form-control"></textarea>
		              				</div>
		              				<div class="col-4">
		              					<label for="">Ruta:</label>
		              					<select  data-tipe="rutas"  class="form-control"  v-model="form.ruta_id">
		              						<option value="">Seleccionar..</option>
		              						<option v-for="item in rutas" :value="item.id" :key="item.id" >{{ item.nombre }} || {{item.direccion}}</option>
		              					</select>
		              				</div>
		              			</div>
		              			<div class="row">
		              				
		              				
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

	export default {
		components: {
	      SectionContent,HeaderTitle,ErrorsForm,successMessage
	    },
	    data: function() {
	    	return {
	    		url_table:route('vehiculos.index'),
	    		rutas:[],
	    		validationForm:[],
	    		message_success:'',
	    		form:{
	    			nombres:'',
	    			apellidos:'',
	    			identificacion:'',
	    			telefono:'',
	    			email:'',
	    			direccion:'',
	    			ruta_id:null,
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
	    		axios.get(route('clientes.create')).then((response) => {
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

	    		axios.post(route('clientes.save'),this.form).then((response) => {
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