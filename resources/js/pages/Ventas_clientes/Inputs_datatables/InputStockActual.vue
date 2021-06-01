<template>
	<div>
		<input type="text" class="form-control"    :id="`stockActual${id}`"  :data-id="id"  :ref="`stockActual${id}`" :value="stocks" readonly="">
		<input type="hidden" class="form-control"    :id="`stockActualHidden${id}`"  :value="stocks">
	</div>
</template>
<script>
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
				let item_input  =  this.$store.getters.itemsModify.find(item => item.id === this.id) 

				// TUVE QUE HACER UNA VALIDACION SI VENIA UNDEFINED POR QUE DABA ERROR CUANDO RENDERIZABA Y SE ESCRIBIA EN EL DOM SALIA VACIA PERO CUANDO EL COMPUTED ACTUALIZA TRAE SU VALOR CORRESPONDIENTE.............................
				return item_input !== undefined ? item_input.stock_actual : 0;
				//------------------------------------------------------------------------------
			}
		},
		/*beforeRouteUpdate(to, from, next) {
		    this.param = to.params.param;

		    next();
		}*/

	}

</script>