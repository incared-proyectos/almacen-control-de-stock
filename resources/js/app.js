require('./bootstrap');
window.Vue = require('vue').default;
import 'datatables.net-bs4/js/dataTables.bootstrap4.min.js';
import VueRouter from 'vue-router'
import router from './router';
import Vuex from 'vuex'


Vue.use(VueRouter)
Vue.use(Vuex)

const app = new Vue({
    el: '#app',
    router
});
