<template>
	<div>
		<section-content>
		    <!-- Main row -->
		    <div class="row">
		    	<div class="col-12">
			     	<div class="card">
			     	   <div class="card-header bg bg-info">
			     	   		<b><i class="fas fa-store"></i> Almacen</b>
			     	   </div>
		              <div class="card-body">
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
	    		url_table:route('almacen.index'),
	    		columns:[
			        {
			        	data:'id',
			        },
			        {
			        	data:'nombre',
			        },
			        {
			        	data:'created_at',
			        },

			    ],
	    	}
	    },
	    mounted(){
	    	this.url_table 
	    }

	}
</script>