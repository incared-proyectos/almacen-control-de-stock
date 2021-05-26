<template>
	<div>
		<div class="alert alert-success" :style="{display:style}">
			<p>{{message}}</p>
		</div>
	</div>
</template>
<script>

    export default {
    	props:['message'],
    	computed:{
    		style(){
    			return this.message == '' ? 'none' : 'block';
    		},
    	}
    }

</script>
