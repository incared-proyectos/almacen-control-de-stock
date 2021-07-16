import Vue from 'vue';
import Vuex from 'vuex';
import stock_productos from './modules/stock_productos';
import stock_ventas_clientes from './modules/stock_ventas_clientes';
import searchvalue from './modules/datatablesSearch';
import userinit from './modules/UserInit';

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        stock_productos,
        stock_ventas_clientes,
        searchvalue,
        userinit
    }
});