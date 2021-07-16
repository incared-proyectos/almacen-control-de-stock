<template>
	<div>
		<input type="text" class="form-control stocks_inputs"   :id="`stock${id}`"  :data-id="id"  @keyup="stocksCalculated">
	</div>
</template>
<script>
	import  {mapGetters,mapActions} from 'vuex'

	export default{
		props: ['id','stock','cellEditInput','stock_actual','cellsedit'],


		data: function() {	
			return{
				stockvadd:0,
			}
		},
		created(){
			
		},
		mounted(){

		},
		methods:{
			//...mapActions(['setStockVehiculo']),
			stocksCalculated(event){
				let valueThis = Number($(event.currentTarget).val());
				let idTable = $(event.currentTarget).attr('data-id');

				let stock_actual = Number($(`#stockActualHidden${idTable}`).val());

				if (valueThis == 0 ) {
					$(`#stockActual${idTable}`).val($(`#stockActualHidden${idTable}`).val());
				}else{
					
					let stockcalculated = (stock_actual > 0) ? stock_actual+valueThis : valueThis;
					
					$(`#stockActual${idTable}`).val(stockcalculated);

				}
			}
		
		},
		computed:{
			/*stocksinput(){
				let item = this.cellsedit.find(item => item.id === this.id)
				return item !== undefined ? item.pivot.stock_product : 0
			}*/
			/*stock_input: {
			    get () {
			      let item_input  =  this.$store.getters.stockModify.find(item => item.id === this.id) 
			      return item_input !== undefined ? item_input.stockactual : 0
			    },
			    set (value) {
			      this.$store.commit('addstocks2',{
			      	id:this.id,
			      	stockgeneral:this.stock_actual,
			      	value
			      } )
			    }
			}*/
		}

	}

</script>