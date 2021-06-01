<template>
	<div>

		    <!-- Main row -->
        <div class="table-responsive">
            <data-table :columns="columns" class="table"  :urltable="url_table"></data-table>
		</div>
	</div>
</template>
<script>

	import DataTable from '@/components/datatables/DataTable.vue';
	export default {
		props:['stockinputs'],
		components: {
			DataTable
	    },
	    data: function() {
	    	return {
	    		url_table:route('productos.stocks_productos',{id:this.$parent.$route.params.id}),
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
			        	data:'stock_vehicle',
			        	orderable: false,
			          	searchable: false,
			          	createdCell:this.createdCellStock,
			        },
			        {
			        	data:'precio',
			        },
			        {
			        	data:'created_at',
			        },

			    ],
	    	}
	    },
	    mounted(){	
	    },
	    methods:{
	    	createdCellStock(cell,cellData,rowData){
	    		let me = this;
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/pages/Vehiculos/Inputs_datatables/InputStock.vue').default);
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
	            let actions = Vue.extend(require('@/pages/Vehiculos/Inputs_datatables/InputStockActual.vue').default);
	            let store = this.$store;
	            let instance = new actions({
	            	store,
	                propsData: rowData
	            });
	            instance.$mount();
	            $(cell).empty().append(instance.$el);  
	    	},
	    	createdCellAction(cell, cellData, rowData) {
	         	let me = this;
	     
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/components/datatables/actions.vue').default);
	            let instance = new actions({
	                propsData: rowData
	            });
	            instance.$mount();

	            $(cell).empty().append(instance.$el);  
	      	}
	    }

	}
</script>