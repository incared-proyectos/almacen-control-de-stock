<template>
	<div>
		<input type="text" class="form-control stocks_inputs"    :data-id="id"  :value="precio" readonly="">
	</div>
</template>
<script>
	import  {mapGetters,mapActions} from 'vuex'

	export default{
		props: ['id','stock','cellEditInput','stock_actual','cellsedit','precio'],


		data: function() {	
			return{
				stockvadd:0,
			}
		},
		created(){

		},
		computed:{
	
		}

	}

</script>