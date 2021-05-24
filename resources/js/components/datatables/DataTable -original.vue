<template>
    <table>
        <thead>
        <tr>
            <th v-for="column in parameters.columns" v-html="title(column)"></th>
        </tr>
        </thead>
        <tfoot v-if="footer">
        <tr>
            <th v-for="column in parameters.columns" v-html="column.footer"></th>
        </tr>
        </tfoot>
    </table>
</template>

<script>
    window.$ = window.jQuery = require('jquery');

    export default{
        data() {
            return {
                dataTable: {},
            }
        },
        methods: {
            title(column) {
                return column.title || this.titleCase(column.data);
            },
            titleCase(str) {
                return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
            }
        },
        computed: {
            parameters() {
                const vm = this;
                return window.$.extend({
                        serverSide: true,
                        processing: true
                   }, {
                   ajax: this.ajax,
                   columns: this.columns,
                   createdRow(row, data, dataIndex) {
                      vm.$emit('created-row', $(row).attr( 'id','codenv'+data.id ));
                   },
                   
                }, this.options);
            }
        },
        props: {
            footer: { default: false },
            columns: { type: Array },
            ajax: { default: '' },
            options: { }
        },
        mounted() {
           this.dataTable = window.$(this.$el).DataTable(this.parameters);
        },
        destroyed() {
            this.dataTable.destroy();
        }
    }
</script>