<template>
    <div>
        <!-- Modal -->
        <button  @click="initpdf" class="btn btn-primary btn-sm"  title="Editar"  >
            <i class="fas fa-file-pdf"></i>
        </button>
    
    </div>
</template>

<script>
    export default{
      props: ['id','action','url_action','url_edit','url_delete'],
      methods: {
        initpdf(event) {
            this.$emit("initpdf");
        }
      },
    }
</script>