<template>
	<div>
		<!-- Modal -->
		<modal :showModal="showModal">
			<template v-slot:header>
			    {{tipemessage}}
			</template>
	      	<errors-form :errors="validationForm"/>
			<success-message :message="message_success"/>

	       	<form action="" @submit.prevent="formsave">
	       		<div class="row">
		       		<div class="col-6 "> 
		       			<label for="">Nombre:</label>
		       			<input type="text" class="form-control" v-model="form.nombre">
		       		</div>
		       		<div class="col-6">
		       			<label for="">Marca:</label>
		       			<input type="text" class="form-control" v-model="form.marca">
		       		</div>
		  
	       		</div>
	       		<hr>
	       		<div class="row">
	       			<div  class="col-6"> 
		       			<label for="">Stock:</label>
		       			<input type="text" class="form-control" v-model="form.stock">
		       		</div>
		       		<div  class="col-6"> 
		       			<label for="">Precio:</label>
		       			<input type="text" class="form-control" v-model="form.precio">
		       		</div>
	       		</div>
	       		<hr>
	       		<div class="row">
		       		<div class="col-12">
		       			<Label>Descripcion:</Label>
		       			<textarea v-model="form.descripcion"  cols="30" rows="5" class="form-control">
		       				
		       			</textarea>
		       		</div>
	       		</div>
	       		<hr>
	       		<div class="row">
	       			<div class="col-12 text-center">
	       				<button class="btn btn-primary">Guardar</button>
	       			</div>
	       		</div>
	       	</form>
		</modal>
	</div>
</template>

<script>
	import SectionContent from "@/components/SectionContent.vue"
	import HeaderTitle from "@/components/HeaderTitle.vue"
	import ErrorsForm from "@/components/ValidationErrors.vue"
	import Modal from '@/components/Modal.vue';
	import successMessage from '@/components/SuccessMessage';

	export default {
		props:['form','tipe','urlform','tipemessage','validation','showModal'],
		components: {
	      SectionContent,HeaderTitle,ErrorsForm,successMessage,Modal
	    },
	    data: function() {
	    	return {
	    		validationForm:[],
	    		message_success:'',
	    		fullPage: false
	    	}
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
	    	loader(){
	    		return this.$loading.show({
                  // Optional parameters
                  container: this.fullPage ? null : this.$refs.formContainer,
                  canCancel: false,
                  onCancel: this.onCancel,
                });
	    	},
	    	resetmessage(){
	    		let me =  this;
	    		setTimeout(function(){ me.message_success = '' ;me.validationForm = [];}, 7000);
	    	},
	    	formsave(){
	    		let loader = this.loader();
	    		let me = this;
	    		this.message_success = ''

	    		axios.post(this.urlform,this.form).then((response) => {
	    			me.validationForm = ''
	    			if (me.tipe == 'create') {
	    				me.clearform()
	    			}
	    		    me.message_success = response.data.success
	    		    $('#table_id').DataTable().ajax.reload();

	    		    loader.hide()
	    		    me.resetmessage();

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

	    }

	}
</script>