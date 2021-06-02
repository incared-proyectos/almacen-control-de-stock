<template>
    <table class="table table-bordered table-striped dataTable" id="table_id" style="width:100%;">
        <thead>
        <tr>
            <th v-for="column in columns" v-html="title(column)"></th>
        </tr>
        </thead>
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
                let replacetitle = column.title || this.titleCase(column.data);
                let column_title = replacetitle.replace(/_/g, " ");
                return column_title;
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
                   ajax:{
                        url: this.urltable,
                        dataSrc: "data",
                        type: "GET",
                        error: function(jqXHR, ajaxOptions, thrownError) {
                            if (thrownError == 'Forbidden') {
                                location.href = base_url_http+'/home';
                            }
                            alert(thrownError)
                            alert(jqXHR)
                            console.log(`${jqXHR}  &&&&  ${ajaxOptions} &&&& ${thrownError}`)
                        },
                    },
                    "order": [[ 0, 'desc' ]],

                   columns: this.columns,
                   createdRow(row, data, dataIndex) {
                      vm.$emit('created-row',$(row).attr( 'id','codenv'+data.id ));
                   },
                 
                   
                }, this.options);
            }
        },
        props: {
            footer: { default: false },
            columns: { type: Array },
            ajax: { default: '' },
            urltable:{default:''},
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