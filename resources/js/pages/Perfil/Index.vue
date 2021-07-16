<template>
	<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Edicion de perfil</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
	      	<errors-form :errors="validationForm"/>
			<success-message :message="message_success"/>

	      	<form action="" @submit="change_profile">
		      	<div class="row justify-content-center">
		      		<div class="col-5 text-center content_img">
		      			<img src="#" v-if="url_img == null"  id="img_profile"  :src="userimg" alt="" width="150px" class="profile-img">
		      			<img src="#" v-if="url_img !== null"  id="img_profile"  :src="url_img" alt="" width="150px" class="profile-img">
		      			<div class="middle">
					    	<div class="text">
					    		<input type="file"   @change="onSelectFile" ref="attachment" style="display:none;" name="file">
					    		<a href="#" class="btn btn-primary mt-2"  @click="opendeFolder"><i class="fas fa-camera"></i> Cambiar</a></div>
					  	</div>
		      		</div>
		      	</div>
		      	<hr>
		      	<div class="row mt-2">
		      		<div class="col-4">
		      			<label for="">Nombre:</label>
		      			<input type="text" name="name" class="form-control" :value="user.name">
		      		</div>
		      		<div class="col-4">
		      			<label for="">Email:</label>
		      			<input type="text" name="email" class="form-control" :value="user.email">
		      		</div>
		      		<div class="col-4">
		      			<label for="">Password:</label>
		      			<input type="password" name="password" class="form-control" >
		      		</div>
		      	</div>
		      
		      	<hr>
		      	<div class="row mt-3">
					<div class="col-12 text-center"> 
						<button class="btn btn-primary">Guardar</button>
					</div>		      		
		      	</div>
		     </form>
	      </div>
	    </div>
	  </div>
	</div>
</template>

<script>
import ErrorsForm from "@/components/ValidationErrors.vue"
import successMessage from '@/components/SuccessMessage';

export default {
	props:['asset'],
    data: function() {
      return {
      	url_img:null,
      	validationForm:[],
	    message_success:'',
	    fullPage: false
      };
    },
    components: {
		ErrorsForm,successMessage
    },
    computed:{
    	user(){
    		return this.$store.getters.getUser
    	},
    	userimg(){
    		let user = this.$store.getters.getUser;
    		return user.img_src !== null ? `${this.asset}storage/profile/${user.id}/${user.img_src}` :  `${this.asset}img/avatar5.png`
    	}
    },
    methods: {
    
		opendeFolder(){
  			this.$refs.attachment.click()
		},
		onSelectFile (event) {
		    const file = event.currentTarget.files[0];

      		this.url_img = URL.createObjectURL(file);

		},
		set_values(data){
        let me = this;
        let formData = new FormData(data);
        const data_iput = {}; 
        for (let [key, val] of formData.entries()) {
         	Object.assign(data_iput, {[key]: val})
        }
        this.user_object = data_iput; 
   	},
   	resetmessage(){
  		let me =  this;
  		setTimeout(function(){ me.message_success = '' ;me.validationForm = [];}, 7000);
    },
    loader(){
  		return this.$loading.show({
            // Optional parameters
            container: this.fullPage ? null : this.$refs.formContainer,
            canCancel: false,
            onCancel: this.onCancel,
          });
  	},
		change_profile(event){
	    let loader = this.loader();

		  let formData = new FormData(event.currentTarget);
		   this.set_values(event.currentTarget);
		   let me = this;

		   this.message_success = ''

		   event.preventDefault();
		   axios({
			  method: 'POST',
			  url: route('perfil.save'),
			  data: formData,
			  headers: {
              	'Content-Type': 'multipart/form-data'
        	  }
			})
		    .then(function (response) {
		    	if (me.url_img !== null) {
		    		$('#img_aside').attr('src',me.url_img);
		    	}
		    	me.$store.dispatch('usersession')
		    	me.message_success = response.data.success
					loader.hide()
	    		me.resetmessage();
		    })
		   .catch(function (error) {
		   		loader.hide()
	    		me.validationForm = ''
			    if (error.response.status == 422){
			    	me.validationForm = error.response.data;
		      	}else if (error.response.status == 500) {
		        	alert(error.response.data.message)
		      	}
			});
		},
    },
  }

</script>