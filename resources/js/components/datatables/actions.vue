<template>
    <div>
        <!-- Modal -->

        <button  @click="edit" class="btn btn-primary btn-sm"  title="Editar"  >
            <slot><i class="fas fa-edit"></i></slot>
        </button>
        <button @click="delete_row" class="btn btn-danger btn-sm" title="Eliminar" >
            <slot><i class="fas fa-trash-alt"></i></slot>
        </button>
    </div>
</template>

<script>
    export default{
        props: ['id','action','url_action'],
        methods: {
        formLoading(contianer){
            return this.$loading.show({
              // Optional parameters
              container: this.fullPage ? null : document.getElementById(`${contianer}`),
              canCancel: true,
              onCancel: this.onCancel,
            });
          },
          edit(event) {
         
          },

          delete_row(event) {
            let me = this;
            axios.post(route('vehiculos.delete'), {
              id_data: this.id,
            }).then((response) => {
              $(`#codenv${me.id}`).remove();
            }).catch((error) => {
              console.error(error);
            }).finally(() => {
              // TODO
            });
          }
        },
    }
</script>