<template>
	<div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <img :src="userimg" class="img-circle elevation-2" alt="User Image">
      </div>
      <div class="info">
        <a href="#" class="d-block">{{user.name}}</a> <div class="info" style="position: absolute; right: 0px;     top: 0px;"><a href="#" data-toggle="modal" data-target="#editProfileModal" class="d-block"><i class="fas fa-edit"></i></a></div>
      </div>
    </div>
</template>

<script>
export default {
	props:['asset'],
    data: function() {
      return {
      	url_img:null
      };
    },
    created() {
    	this.$store.dispatch('usersession')
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
  }

</script>