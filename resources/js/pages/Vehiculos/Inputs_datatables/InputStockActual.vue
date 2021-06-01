<template>
	<div>
		<input type="text" class="form-control"    :id="`stockActual${id}`"  :data-id="id"  :value="stocks" readonly="">
		<input type="hidden" class="form-control"    :id="`stockActualHidden${id}`"  :value="stocks">
	</div>
</template>
<script>
	import  {mapGetters,mapActions} from 'vuex'

	export default{
		props: ['id','stock','stock_actual'],


		data: function() {	
			return{
				stock_input:0,
			}
		},
	
		mounted(){
		},
		methods:{

		},
		computed:{
		
			stocks(){
				return this.stock_actual;
			}
		},
		created(){

		},
		/*beforeRouteUpdate(to, from, next) {
		    this.param = to.params.param;

		    next();
		}*/

	}

</script>