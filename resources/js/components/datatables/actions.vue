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
        props: ['id','action','url_action','url_edit','url_delete'],
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
            //this.$parent.$router.push(this.url_edit)

            this.$emit("edit_emit");

          },

          delete_row(event) {

            let me = this;

            swal.fire({
              title:'Estas seguro?',
              text: "Esta accción es irreversible",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Si, eliminar!'
            }).then((result) => {
              if (result.isConfirmed) {           
                axios.post(this.url_delete, {
                  id_data: this.id,
                }).then((response) => {
                  $(`#codenv${me.id}`).remove();
                }).catch((error) => {
                  console.error(error);
                });
              }
            })
          }
        },
    }
</script>