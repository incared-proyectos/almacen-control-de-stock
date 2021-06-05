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

     //state.items_modify. = state.precioTotal + payload.precio 

      state.precioTotal = state.precioTotal + payload.precio_total

    },
    totalesCalculated(state){
        let priceTot = 0
        Object.keys(state.itemsModify).map(function (item) {
            //pricestock = state.itemsModify[item].stock_venta * state.itemsModify[item].precio
            priceTot += Number(state.itemsModify[item].precio_total)
        });
        state.precioTotal = priceTot
    },
    operationItem(state,payload){
        let items_actual = state.itemsActual.find(item => item.id === payload.id)
        let items_modify = state.itemsModify.find(item => item.id === payload.id)
         state.errorsInput = []
        
        if(payload.operation == 'dismiss_stock'){
            if (payload.value == '') {
                items_modify.stock_actual = items_actual.stock_actual 
                items_modify.stock_venta = '' 
                items_modify.precio_total = 0
                return;
            }
            if (Number(items_actual.stock_actual) < payload.value ) {
                state.errorsInput.push({error:'El Stock ingresado es mayor al actual'});
                items_modify.stock_actual = items_actual.stock_actual 
                return;
            }
            items_modify.stock_actual =  (items_actual.stock_venta ==  payload.value) ? items_modify.stock_actual : Number(items_actual.stock_actual) - payload.value
            items_modify.stock_venta = payload.value

            items_modify.precio_total = items_modify.stock_venta * items_modify.precio


        }
        if (payload.operation == 'preciocaltulated') {
            if (payload.value == '') {
                items_modify.precio = '' 
                items_modify.precio_total = 0
                return;
            }
            items_modify.precio = payload.value
            items_modify.precio_total = items_modify.stock_venta * payload.value

        }
        if (payload.operation == 'precio_calculated') { 
            let priceTot = 0
            let pricestock = 0
            //items_modify.precio_total = 0

            Object.keys(state.itemsModify).map(function (item) {
                //pricestock = state.itemsModify[item].stock_venta * state.itemsModify[item].precio
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