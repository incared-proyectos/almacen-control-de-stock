<template>
	<div>
		<header-title>Home</header-title>
		<section-content>
		    <!-- Small boxes (Stat box) -->
		    <div class="row">
		      <div class="col-lg-3 col-6">
		        <!-- small box -->
		        <div class="small-box bg-info">
		          <div class="inner">
		            <h3>150</h3>

		            <p>New </p>
		          </div>
		          <div class="icon">
		            <i class="ion ion-bag"></i>
		          </div>
		          <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		        </div>
		      </div>
		      <!-- ./col -->
		      <div class="col-lg-3 col-6">
		        <!-- small box -->
		        <div class="small-box bg-success">
		          <div class="inner">
		            <h3>53<sup style="font-size: 20px">%</sup></h3>

		            <p>Bounce Rate</p>
		          </div>
		          <div class="icon">
		            <i class="ion ion-stats-bars"></i>
		          </div>
		          <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		        </div>
		      </div>
		      <!-- ./col -->
		      <div class="col-lg-3 col-6">
		        <!-- small box -->
		        <div class="small-box bg-warning">
		          <div class="inner">
		            <h3>44</h3>

		            <p>User Registrations</p>
		          </div>
		          <div class="icon">
		            <i class="ion ion-person-add"></i>
		          </div>
		          <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		        </div>
		      </div>
		      <!-- ./col -->
		      <div class="col-lg-3 col-6">
		        <!-- small box -->
		        <div class="small-box bg-danger">
		          <div class="inner">
		            <h3>65</h3>

		            <p>Unique Visitors</p>
		          </div>
		          <div class="icon">
		            <i class="ion ion-pie-graph"></i>
		          </div>
		          <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		        </div>
		      </div>
		      <!-- ./col -->
		    </div>
		    <!-- /.row -->
		      <!-- Main row -->
		    <div class="row">
		    	<div class="col-12">
			     	<div class="card">
			     	   <div class="card-header bg bg-info">
			     	   		<b>BIENVENIDO A NUESTRO SISTEMA VUEJS, VUEX, VUE-ROUTER, LARAVEL</b>
			     	   </div>
		              <div class="card-body">

		                <p class="card-text">
		                  Lorem ipsum dolor sit amet consectetur adipisicing, elit. Nihil consequatur sapiente incidunt est nam nostrum aut repellendus dolorem reiciendis eos mollitia tempore eum, sed saepe, repellat totam. Quaerat nostrum, quibusdam.
		                </p>

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
	export default {
		components: {
	      SectionContent,HeaderTitle
	    }
	}
</script>