<template>
	<div>
		<section-content>
		    <!-- Main row -->
		    <div class="row">
		    	<div class="col-12">
			     	<div class="card">
			     	   <div class="card-header bg bg-info">
			     	   		<b><i class="fas fa-shopping-cart"></i> Ventas clientes</b>
			     	   </div>
		              <div class="card-body">
		              	<div class="row mb-2">
	              			<div class="row">
	              				<div class="col-12">
	              					<router-link  to="/ventas_clientes/create"  class="btn btn-primary">
							            <i class="fas fa-plus-square"></i>
							              ADD
							         </router-link> 
	              				</div>
	              			</div>
	              		</div>
		                <div class="table-responsive">
		                      <data-table :columns="columns" class="table"  :urltable="url_table"></data-table>
		        		</div>

		              </div>
		            </div>

		     	</div>
		    </div>
		    <!-- /.row (main row) -->
		</section-content>

	</div>
</template>
<script>
	import SectionContent from "@/components/SectionContent.vue"
	import HeaderTitle from "@/components/HeaderTitle.vue"
	import DataTable from '@/components/datatables/DataTable.vue';
	export default {
		components: {
	      SectionContent,HeaderTitle,DataTable
	    },
	    data: function() {
	    	return {
	    		url_table:route('ventas_clientes.index'),
	    		columns:[
			        {
			        	data:'id',
			        },
			        {
			        	data:'codigo',
			        },
			        {
			        	data:'cifnif',
			        },
			        {
			        	data:'nombres',
			        },
			        {
			        	data:'direccion',
			        },
			        {
			        	data:'created_at',
			        },
			        {
			        	data:'action',
			        	orderable: false,
			          	searchable: false,
			          	createdCell:this.createdCell,
			        },
			        {
			        	data:'actionpdf',
			        	orderable: false,
			          	searchable: false,
			          	createdCell:this.createdCellPDF,
			        }

			    ],
	    	}
	    },
	     methods:{
		    createdCell(cell, cellData, rowData) {
	          	let me = this;
	 
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/components/datatables/actions.vue').default);
	            let instance = new actions({
	                propsData: {
	                	id:rowData.id,
	                	url_delete:route('ventas_clientes.delete')
	                },
	            });
	            instance.$mount();
	            instance.$on('edit_emit', function(event) {
	             	me.$router.push(`ventas_clientes/edit/${rowData.id}`);
	            })
	            $(cell).empty().append(instance.$el);
	      	},
	      	createdCellPDF(cell, cellData, rowData) {
	          	let me = this;
	 
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/components/datatables/actionPDF.vue').default);
	            let instance = new actions({
	                propsData: {
	                	id:rowData.id,
	                },
	            });
	            instance.$mount();
	            instance.$on('initpdf', function(event) {
	             	window.location.href = route('ventas_clientes.pdfinit',{id:rowData.id});
	            })
	            $(cell).empty().append(instance.$el);
	      	}
	    },
	    mounted(){
	    }

	}
</script>