<template>
	<div>
		<input type="text" class="form-control stocks_inputs"    :data-id="id" :value="inputvalue"  required="">
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
			//OBTENEMOS EL VALOR DEL INPUT MEDIANTE VUEX Y SU V-MODEL DE ESTA FORMA VALIDAMOS EN EL VUEX 
			inputvalue: {
			    get () {
			      let item_input  =  this.$store.getters.itemsModify.find(item => item.id === this.id) 
			      return (item_input !== undefined) ? item_input.precio_total : 0 // TUVE QUE HACER UNA VALIDACION SI VENIA UNDEFINED POR QUE DABA ERROR CUANDO RENDERIZABA Y SE ESCRIBIA EN EL DOM SALIA VACIA PERO CUANDO EL COMPUTED ACTUALIZA TRAE SU VALOR CORRESPONDIENTE.............................
			    },
			    set (value) {
			      this.$store.commit('operationItem',{
			      	id:this.id,
			      	operation:'precio_calculated',
			      	value
			      })
			    }
			}
		}

	}

</script>