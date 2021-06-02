<template>
	<div>
        <div class="table-responsive">
            <data-table :columns="columns" class="table"  :urltable="url_table"></data-table>
            <div class="container-fluid">
	            <div class="row justify-content-end">
	            	<div class="col-4 p-0">
			            <table class="table table-bordered">
			            	<tr>
			            		
			            		<td >Total:</td>
			            		<td>{{total}}</td>
			            	</tr>
			            </table>
		            </div>
	            </div>
            </div>
		</div>
	</div>
</template>
<script>

	import DataTable from '@/components/datatables/DataTableProductos.vue';
	import  {mapGetters,mapActions} from 'vuex'

	export default {
		props:['stockinputs','casetable','route'],
		components: {
			DataTable
	    },
	    created(){

	    	this.init();
	    },
	    data: function() {
	    	return {
	    		url_table:this.route,
	    		columns:[
			        {
			        	data:'id',
			        },
			        {
			        	data:'nombre',
			        },
			        {
			        	data:'stock',
			        },
			        {
			        	data:'stock_actual',
			        	orderable: false,
			          	searchable: false,
			          	createdCell:this.createdCellStockActual,
			        },
			        {
			        	data:'stock_venta',
			        	orderable: false,
			          	searchable: false,
			          	createdCell:this.createdCellStock,
			        },
			        {
			        	data:'precio',
			        	orderable: false,
			          	searchable: false,
			          	createdCell:this.createdCellPrice,
			        },
			        {
			        	data:'precio_total',
			        	orderable: false,
			          	searchable: false,
			          	createdCell:this.createdCellPriceTotal,
			        },
			 

			    ],
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
	    		this.$store.commit("clearArray");

	    	},
	    	createdCellStock(cell,cellData,rowData){
	    		let me = this;
	          	$(cell).empty();
	          	
	          	//AGREGAMOS LOS ITEMS QUE VENGA CADA CELDA TRAE EN EL ROW DATA  TODA LA DATA DE CADA ITEM DE ESTE MODO PODREMOS MODIFCARLA CON EL STORE
	     		this.setStocksItem(rowData);

	            let actions = Vue.extend(require('@/pages/Ventas_clientes/Inputs_datatables/InputStock.vue').default);
	            let store = this.$store;
	            rowData.cellsedit = this.stockinputs
	            let instance = new actions({
	            	store,
	                propsData: rowData
	            });
	            instance.$mount();
	            $(cell).empty().append(instance.$el);  
	    	},
	    	createdCellStockActual(cell,cellData,rowData){
	    		let me = this;
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/pages/Ventas_clientes/Inputs_datatables/InputStockActual.vue').default);
	            let store = this.$store;
	            let instance = new actions({
	            	store,
	                propsData: rowData
	            });
	            instance.$mount();
	            $(cell).empty().append(instance.$el);  
	    	},
	    	createdCellPrice(cell,cellData,rowData){
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/pages/Ventas_clientes/Inputs_datatables/InputPrecio.vue').default);
	            let store = this.$store;
	            let instance = new actions({
	            	store,
	                propsData: rowData
	            });
	            instance.$mount();
	            $(cell).empty().append(instance.$el);  
	    	},
	    	createdCellPriceTotal(cell,cellData,rowData){
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/pages/Ventas_clientes/Inputs_datatables/InputPrecioCalculated.vue').default);
	            let store = this.$store;
	            let instance = new actions({
	            	store,
	                propsData: rowData
	            });
	            instance.$mount();
	            $(cell).empty().append(instance.$el);  
	    	}
	    }

	}
</script>