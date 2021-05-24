<template>
    <div>
        <!-- Modal -->

        <button  @click="edit" class="btn btn-primary btn-sm"  title="Editar" :data-id="id"  v-if="action == 'all' || action == 'edit'">
            <slot><i class="fas fa-edit"></i></slot>
        </button>
        <button @click="delete_row" class="btn btn-danger btn-sm" title="Eliminar" :data-id="id" v-if="action == 'all' || action == 'delete'">
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
                let id_col = $(event.currentTarget).attr('data-id');
                this.$emit("edit_emit", id_col);
            },

            delete_row(event) {
              let me = this;
              let id_delete = $(event.currentTarget).attr('data-id');

              swal.fire({
                title: 'Estas Seguro?',
                text: "Esta accion es irreversible",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, Eliminar!'
              }).then((result) => {
                if (result.isConfirmed) {
                  let loading = this.formLoading('table');
                  axios({ 
                    method: 'DELETE',
                    url: `${this.url_action}`,
                    data: $(event.target).serialize(),
                  })
                  .then(function (response) {
                    me.$emit("success",'Registro eliminado con exito');
                    loading.hide();
                    $(`#codenv${id_delete}`).remove();
                  })
                  .catch(function (error) {
                    if (error.response.status == 422){
                      me.validationErrors = error.response.data.error;
                    }else if (error.response.status == 500) {
                      alert(error.response.data.message)
                    }
                  })
                }
              })
            }
        },
    }
</script>