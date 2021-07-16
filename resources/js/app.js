require('./bootstrap');
window.moment = require('moment');
window.swal = require('sweetalert2') // added here
window.Vue = require('vue').default;
import '../plugins/input-calendar/js/bootstrap-datepicker.min.js';

import 'datatables.net-bs4/js/dataTables.bootstrap4.min.js';
import VueRouter from 'vue-router'
import router from './router';
import Vuex from 'vuex'
import VueDatePicker from '@mathieustan/vue-datepicker';
import '@mathieustan/vue-datepicker/dist/vue-datepicker.min.css';


import store from './store'
import Loading from 'vue-loading-overlay';
// Import stylesheet
import 'vue-loading-overlay/dist/vue-loading.css';

Vue.use(Loading);
Vue.use(VueRouter)
Vue.use(Vuex)
Vue.use(VueDatePicker);

Vue.component(
    'info-profile',
    require('@/pages/Perfil/Info.vue').default
);
Vue.component(
    'modal-profile',
    require('@/pages/Perfil/Index.vue').default
);

const app = new Vue({
    el: '#app',
    router,
    store
});
