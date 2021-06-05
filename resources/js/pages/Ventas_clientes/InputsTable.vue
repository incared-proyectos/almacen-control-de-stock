<template>

	<tr>
		<td>{{item.nombre}}</td>
		<td>{{item.stock}}</td>	
        <td><input type="text"  :value="stocks"  readonly=""   class="form-control " ></td>
		<td><input type="text"  v-model="stockventa" class="form-control" ></td>
		<td><input type="text"  v-model="precio" class="form-control"  ></td>
		<td><input type="text"  :value="preciototal" class="form-control" readonly="" ></td>
	</tr>
</template>
<script>
	export default {
		props:['itemid','item'],
		computed:{
			stocks(){
				let item_input  =  this.$store.getters.itemsModify.find(item => item.id === this.item.id) 

				// TUVE QUE HACER UNA VALIDACION SI VENIA UNDEFINED POR QUE DABA ERROR CUANDO RENDERIZABA Y SE ESCRIBIA EN EL DOM SALIA VACIA PERO CUANDO EL COMPUTED ACTUALIZA TRAE SU VALOR CORRESPONDIENTE.............................
				return item_input !== undefined ? item_input.stock_actual : 0;
				//------------------------------------------------------------------------------
			},
			//OBTENEMOS EL VALOR DEL INPUT MEDIANTE VUEX Y SU V-MODEL DE ESTA FORMA VALIDAMOS EN EL VUEX 
			stockventa: {
			    get () {
			      let item_input  =  this.$store.getters.itemsModify.find(item => item.id === this.item.id) 
			      //console.log(item_input);
			      return (item_input !== undefined) ? item_input.stock_venta : 0 // TUVE QUE HACER UNA VALIDACION SI VENIA UNDEFINED POR QUE DABA ERROR CUANDO RENDERIZABA Y SE ESCRIBIA EN EL DOM SALIA VACIA PERO CUANDO EL COMPUTED ACTUALIZA TRAE SU VALOR CORRESPONDIENTE.............................
			    },
			    set (value) {
			      this.$store.commit('operationItem',{
			      	id:this.item.id,
			      	operation:'dismiss_stock',
			      	value
			      })
			      this.$store.commit('totalesCalculated')
			    }
			},
			precio:{
				get () {
			      let item_input  =  this.$store.getters.itemsModify.find(item => item.id === this.item.id) 
			      //console.log(item_input);
			      return (item_input !== undefined) ? item_input.precio : 0 // TUVE QUE HACER UNA VALIDACION SI VENIA UNDEFINED POR QUE DABA ERROR CUANDO RENDERIZABA Y SE ESCRIBIA EN EL DOM SALIA VACIA PERO CUANDO EL COMPUTED ACTUALIZA TRAE SU VALOR CORRESPONDIENTE.............................
			    },
			    set (value) {
			      this.$store.commit('operationItem',{
			      	id:this.item.id,
			      	operation:'preciocaltulated',
			      	value
			      })
			      this.$store.commit('totalesCalculated')
			    }
			},
			preciototal: {
			    get () {
			      let item_input  =  this.$store.getters.itemsModify.find(item => item.id === this.item.id) 
			      return (item_input !== undefined) ? item_input.precio_total : 0 // TUVE QUE HACER UNA VALIDACION SI VENIA UNDEFINED POR QUE DABA ERROR CUANDO RENDERIZABA Y SE ESCRIBIA EN EL DOM SALIA VACIA PERO CUANDO EL COMPUTED ACTUALIZA TRAE SU VALOR CORRESPONDIENTE.............................
			    },
			    set (value) {
			      this.$store.commit('operationItem',{
			      	id:this.item.id,
			      	operation:'precio_calculated',
			      	value
			      })
			    }
			}
		},
	}

</script>