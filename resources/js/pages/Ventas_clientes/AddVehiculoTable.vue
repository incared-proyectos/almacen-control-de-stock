<template>
	<div>
		<div class="row">
			<div class="col-7">
				<div class="input-group ">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1"><i class="fas fa-search text-blue"></i> </span>
				  </div>
				  <input type="text" class="form-control" placeholder="Buscar productos en vehiculo seleccionado.." aria-label="Username" aria-describedby="basic-addon1" @keyup="search_product">
				</div>
				<div class="search_div">
			    	<ul class="search_ul">
			    		<li class="search_li" v-for="item in lineas_search" :key="item.id" @click="select_search(item.id)"><i class="fas fa-address-card"></i> {{item.nombre}} || {{item.stock}}</li>
			    	</ul>
			    </div>
			</div>
		</div>
        <div class="table-responsive">
            <table class="table table-bordered">
            	<thead>
            		<th>Nombre</th>
            		<th>Stock</th>
            		<th>Stock Actual</th>
            		<th>Stock Venta</th>
            		<th>Precio</th>
            		<th>Precio Total</th>
            	</thead>
            	<tbody>
            		<inputs-table 
            			v-for="item in lineas_data"
            			:item="item"
            			:key="item.id"
            		></inputs-table>

            			<tr>
			            	<td colspan="4"></td>
		            		<td class="text-center text-uppercase font-weight-bold">Total:</td>
		            		<td >{{total}}</td>
		            	</tr>
            	</tbody>
            </table>
		</div>
	</div>
</template>
<script>

	import DataTable from '@/components/datatables/DataTableProductos.vue';
	import  {mapGetters,mapActions} from 'vuex'
	import InputsTable from '@/Pages/Ventas_clientes/InputsTable.vue';
	const shortid = require('shortid');

	export default {
		props:['stockinputs','casetable','route','routesearch','productos'],
		components: {
			DataTable,InputsTable
	    },
	    created(){
	    	this.$store.commit("clearArray");
	    	if (this.casetable == 'update') {
	    		if (this.productos == 'init') {
	    			this.init();
	    			return;
	    		}
	    	}
	    },
	    data: function() {
	    	return {
	    		url_table:this.route,
		    	lineas_data:[],
		    	lineas_search:[],
	    		lineas:{
		    		stock_actual:[],
		    		stock_venta:[],
		    		precio:[],
		    		precio_total:[]
	    		},

	    	}
	    },
	    computed:{
	    	total(){
	    		return this.$store.getters.precioTotal
	    	}
	    },
	    methods:{
	    	...mapActions(['setStocksItem']),
	    	init(){
	    		let me = this;
	    		axios.get(this.url_table).then((response) => {
	    			me.lineas_data = response.data
	    			for (let item of Object.values(me.lineas_data)) {

					 	me.setStocksItem(item);
					}
	    		}).catch((error) => {
			       	alert(error.response.data.message)
	    		})
	    	},
	    	search_product(event){
	    		let me = this;
	    		let search = $(event.currentTarget).val();
	    		axios.get(this.routesearch,{ params: { search} }).then((response) => {
	    			me.lineas_search = response.data
	    		}).catch((error) => {
	    			console.log(error);
	    		})
	    	},
	    	select_search(index){
	    		let search_item = this.lineas_search.find(item => item.id === index)
	    		let search_item_selecteds = null;
	    		if (this.casetable == 'update') {
	    			//CUANDO ES UNA ACTUALIZACION TENEMOS QUE PASAR EL PRODUCTO ID PARA QUE SE IGUAL AL ID DE LA BUSQUEDA Y VALIDAR SI YA EXISTE ESE PRODUCTO AGREGADO 
	    			search_item_selecteds =  this.lineas_data.find(item => item.producto_id === index) 
	    		}else{
	    			search_item_selecteds =  this.lineas_data.find(item => item.id === index) 
	    		}

	    		if (search_item_selecteds === undefined) {
	    			this.lineas_data.push(search_item);
	    			this.setStocksItem(search_item)
	    		}
	    		this.lineas_search = []
	    	}
	    }
	}
</script>