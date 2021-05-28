<template>
	<div>
		<errors-form :errors="validationForm"/>
		<success-message :message="message_success"/>
  		<form  @submit.prevent="formsave" ref="formContainer">
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
  				<div class="col-6">
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
  				<div class="col-6">
  					<slot name="productos"></slot>
  				</div>
  			</div>
  			<div class="row mt-5">
  				<div class="col-12 text-center">
  					<button class="btn btn-primary"><i class="fas fa-save"></i> Guardar</button>
  				</div>
  			</div>
  		</form>
	</div>
</template>
<script>

	import ErrorsForm from "@/components/ValidationErrors.vue"
	import successMessage from '@/components/SuccessMessage';

	export default {
		components: {
	      ErrorsForm,successMessage
	    },
	    data: function() {
	    	return {
	    		url_table:route('vehiculos.index'),
	    		rutas:null,
	    		validationForm:[],
	    		message_success:'',
	    		form:{
	    			nombre:'',
	    			modelo:'',
	    			marca:'',
	    			color:'',
	    			rutas_json:[],
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
	    		axios.get(route('vehiculos.create')).then((response) => {
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