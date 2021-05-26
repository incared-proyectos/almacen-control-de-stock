<template>
    <div class="alert alert-danger text-sm p-2" role="alert" v-if="hasErrors">
        <div class="font-weight-bold">Whoops! Tenemos un problema.</div>

        <ul>
            <li v-for="(error, key) in errors.error" :key="key">{{ error }}</li>
        </ul>
    </div>
</template>

<script>
    export default {
        props:['errors'],
        computed: {
            hasErrors() {
                return Object.keys(this.errors).length > 0;
            },
        }
    }
</script>
