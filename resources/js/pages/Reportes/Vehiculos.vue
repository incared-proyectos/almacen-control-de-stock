<template>
	<div>
		<section-content>
		    <!-- Main row -->
		    <div class="row">
		    	<div class="col-12">
			     	<div class="card">
			     	   <div class="card-header bg bg-info">
			     	   		<b><i class="fas fa-car"></i> Reporte Vehiculos </b>
			     	   </div>
		              <div class="card-body">
		              		<div class="row justify-content-center">
		              			
		              			<div>
		              				<VueDatePicker v-model="fechaAct"  @onChange="tablesearch"></VueDatePicker>
		              			</div>
		              	
		              		</div>
			              	<div class="table-responsive">
		                      <data-table 
		                      :columns="columns" 
		                      class="table"  
		                      :urltable="url_table" 
		                      :searchfecha="fechaDat"
		                      ></data-table>
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
	import DataTable from '@/components/datatables/DataTableReports.vue';

	import { VueDatePicker } from '@mathieustan/vue-datepicker';
	import '@mathieustan/vue-datepicker/dist/vue-datepicker.min.css';

	 import DatePicker from 'vue2-datepicker';
  	import 'vue2-datepicker/index.css';
	
	export default {
		components: {
	      SectionContent,HeaderTitle,DataTable,VueDatePicker,DatePicker
	    },
	    data: function() {
	    	return {
	    		url_table:route('reportes.vehiculos'),
	    		fecha_search:null,
	    		fechaDat: null,
	    		keytable:0,
	    		time1:null,
	    		columns:[
			        {
			        	data:'id',
			        },
			        {
			        	data:'vehiculo',
			        },
			        {
			        	data:'producto',
			        },
			        {
			        	data:'stock_actual',
			        },
			        {
			        	data:'created_at',
			        },
			    ],
	    	}
	    },
	    created(){
	    	//this.fecha_search = moment().format('YYYY/MM/DD')
	    	let me = this;
		
	    },
	    mounted(){
	    	this.url_table 
	    },
	    computed:{
	    	fechaAct: {
			    // getter
			    get: function () {
			      return this.$store.getters.fechaval

			    },
			    // setter
			    set: function (newValue) {
			      this.$store.commit('addvalue',newValue)
			      this.fechaDat = newValue
			    }
			  },
		  	fechaAct2: {
		    // getter
		    get: function () {
		      return this.$store.getters.fechaval

		    },
		    // setter
		    set: function (newValue) {
		   		this.$store.commit('addvalue',newValue)
		      	
		    }
		  	}
	    },
	    methods:{
	    	tablesearch(event){
	    	   $('#table_id').DataTable().draw();
	    	},
		   createdCell(cell, cellData, rowData) {
	          	let me = this;
	 
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/components/datatables/actions.vue').default);
	            let instance = new actions({
	                propsData: {
	                	id:rowData.id,
	                	url_delete:route('vehiculos.delete')
	                },
	            });
	            instance.$mount();
	            instance.$on('edit_emit', function(event) {
	             	me.$router.push(`vehiculos/edit/${rowData.id}`);
	            })
	            $(cell).empty().append(instance.$el);
	          
	      }
	    }

	}
</script>