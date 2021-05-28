import Vue from 'vue';
import Vuex from 'vuex';
import pacientes from './modules/pacientes';
import stock_productos from './modules/stock_productos';

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        pacientes,
        stock_productos
    }
});