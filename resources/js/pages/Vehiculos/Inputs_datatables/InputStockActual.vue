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
        	...mapActions(['setStocks'])
		},
		computed:{
			...mapGetters(['numstock']), //PRUEBAS DE VUEX EN COMPONENTES EXTENDIDOS
			stocks_id(){
				return this.numstock.find(item => item.id === this.id)
			},
			stocks(){
				return this.stock_actual;
			}
		},
		created(){
     		let stocks = {
     			id:this.id,
     			stock:this.stock_actual,
     			stock_actual:this.stock_actual
     		} 
        	this.setStocks(stocks);
		},
		/*beforeRouteUpdate(to, from, next) {
		    this.param = to.params.param;

		    next();
		}*/

	}

</script>