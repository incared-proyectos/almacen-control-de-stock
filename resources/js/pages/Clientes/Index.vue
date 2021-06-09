<template>
	<div>
		<section-content>
		    <!-- Main row -->
		    <div class="row">
		    	<div class="col-12">
			     	<div class="card">
			     	   <div class="card-header bg bg-info">
			     	   		<b><i class="fas fa-user-tie"></i> Clientes</b>
			     	   </div>
		              <div class="card-body">
	              		<div class="row mb-2">
	              			<div class="row">
	              				<div class="col-12">
	              					<router-link  to="/clientes/create"  class="btn btn-primary">
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
	    		url_table:route('clientes.index'),
	    		columns:[
			        {
			        	data:'id',
			        },
			        {
			        	data:'nombres',
			        },
			        {
			        	data:'apellidos',
			        },
			        {
			        	data:'identificacion',
			        },
			        {
			        	data:'created_at',
			        },
			        {
			        	data:'action',
			        	orderable: false,
			          	searchable: false,
			          	createdCell:this.createdCell,
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
	                	url_delete:route('clientes.delete')
	                },
	            });
	            instance.$mount();
	            instance.$on('edit_emit', function(event) {
	             	me.$router.push(`clientes/edit/${rowData.id}`);
	            })
	            $(cell).empty().append(instance.$el);
	          
	      }
	    }

	}
</script>