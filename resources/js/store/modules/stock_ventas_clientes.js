// state having some demo data
const state = {
    itemsActual:[],
    itemsModify:[],
    precioTotal:0,
    errorsInput:[]
};
const mutations = {
    clearArray(state){
        state.itemsActual = []
        state.itemsModify = []
        state.precioTotal = 0
    },
   
    addItem(state,payload){
      state.itemsActual.push(payload)
      state.itemsModify.push(Object.assign({}, payload));
      state.precioTotal = state.precioTotal + payload.precio 
    },
    operationItem(state,payload){
        let items_actual = state.itemsActual.find(item => item.id === payload.id)
        let items_modify = state.itemsModify.find(item => item.id === payload.id)
         state.errorsInput = []
        
        if(payload.operation == 'dismiss_stock'){
            if (payload.value == '') {
                items_modify.stock_actual = items_actual.stock_actual 
                items_modify.stock_venta = '' 

                return;
            }
            if (Number(items_actual.stock_actual) < payload.value ) {
                state.errorsInput.push({error:'El Stock ingresado es mayor al actual'});
                items_modify.stock_actual = items_actual.stock_actual 
                return;
            }
            items_modify.stock_actual =  (items_actual.stock_venta ==  payload.value) ? items_modify.stock_actual : Number(items_actual.stock_actual) - payload.value
            items_modify.stock_venta = payload.value
        }
        if (payload.operation == 'precio_calculated') { 
            let priceTot = 0
     
            items_modify.precio = payload.value
            Object.keys(state.itemsModify).map(function (item) {
                priceTot += Number(state.itemsModify[item].precio)
            });
            state.precioTotal = priceTot

        }

    }
};
const getters = {
    itemsModify: (state) => state.itemsModify,
    precioTotal: (state) => state.precioTotal,
    errorsInput: (state) => state.errorsInput
};
const actions = {
    setStocksItem({commit},item){
      commit('addItem',item)
    },
 
};

export default{
    state,
    getters,
    actions,
    mutations
}