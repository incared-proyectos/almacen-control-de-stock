<template>
    <div>
        <button @click="editUser" class="btn btn-primary">
            <slot>Edit</slot>
        </button>
        <button @click="deleteUser" class="btn btn-primary">
            <slot>Delete</slot>
        </button>
    </div>
</template>

<script>
    export default{
        props: ['id', 'name'],
        methods: {
            editUser() {
                alert('editando')
            },
            deleteUser() {
                alert('holaa')
            }
        },
    }
</script>