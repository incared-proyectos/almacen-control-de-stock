<template>
	<div>
		<div class="alert alert-success" :style="{display:style}">
			<p class="p-0 m-0">{{message}}</p>
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
