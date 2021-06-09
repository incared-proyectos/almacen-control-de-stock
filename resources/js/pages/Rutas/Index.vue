<template>
	<div>
		<section-content>
			<form-modal 
			:tipe="tipeform"
			:urlform="urlform"
			:tipemessage="tipemessage" 
			:form="form"
			:key="componentKey"
			:showModal="showModal"
			/>
		    <!-- Main row -->
		    <div class="row">
		    	<div class="col-12">
			     	<div class="card">
			     	   <div class="card-header bg bg-info">
			     	   		<b><i class="fas fa-route"></i> Rutas</b>
			     	   </div>
		              <div class="card-body">
		              	<button type="button" class="btn btn-primary mb-1" @click.prevent="createform">
		              	  <i class="fas fa-plus-square"></i>
						  ADD
						</button>
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
	import FormModal from '@/pages/Rutas/Form.vue';
	export default {
		components: {
	      SectionContent,HeaderTitle,DataTable,FormModal
	    },
	    data: function() {
	    	return {
	    		url_table:route('rutas.index'),
	    		urlform:null,
	    		tipeform:null,
	    		tipemessage:null,
	    		showModal:false,
	    		componentKey:0,
	    		form:{
	    			nombre:'',
	    			direccion:'',
	    		},
	    		columns:[
			        {
			        	data:'id',
			        },
			        {
			        	data:'nombre',
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
			        }
			    ],
	    	}
	    },
	    methods:{

	       createform(){
             	this.form = {
             		nombre:'',
	    			marca:'',
	    			stock:'',
	    			precio:'',
	    			descripcion:'',
             	}
             	this.urlform = route('rutas.save')
             	this.tipeform = 'create'
             	this.tipemessage = `Crear Ruta `
             	this.componentKey += 1
             	this.showModal = true
	       },
		   createdCell(cell, cellData, rowData) {
	          	let me = this;
	 
	          	$(cell).empty();
	            let actions = Vue.extend(require('@/components/datatables/actions.vue').default);
	            let instance = new actions({
	                propsData: {
	                	id:rowData.id,
	                	url_delete:route('rutas.delete')
	                },
	            });
	            instance.$mount();
	            instance.$on('edit_emit', function(event) {
	             	//me.$router.push(`vehiculos/edit/${rowData.id}`);
	             	me.form = rowData
	             	me.urlform = route('rutas.update')
	             	me.tipeform = 'update'
	             	me.tipemessage = `Actualizar ruta `
	             	me.componentKey += 1
	             	me.showModal=true
	             	//console.log(rowData);

	            })
	            $(cell).empty().append(instance.$el);
	      }
	    }

	}
</script>