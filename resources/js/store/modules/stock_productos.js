// state having some demo data
const state = {
    stockActual:[],
    stockModify:[],
    stockNum:0
};
const mutations = {
    addstockActual(state,payload){
      state.stockActual.push(payload)
    },
    addstocks(state,payload){
     
    },
    addstocks2(state,payload){
        let stockFind = state.stockModify.find(item => item.id === payload.id) 
        if (stockFind !== undefined) {
            stockFind.stockactual = Number(payload.value);
        }else{
            state.stockModify.push({
                id:payload.id,
                stockgeneral:payload.stockgeneral,
                stockactual:Number(payload.value)
            })
        }

        let sumstocks = state.stockActual.find(item => item.id === payload.id)
        sumstocks.stock_actual = Number(sumstocks.stock_actual) + Number(payload.value)


    }
};
const getters = {
    numstock: (state) => state.stockActual,
    stockModify: (state) => state.stockModify
};
const actions = {
    setStocks({commit},stock){
      commit('addstockActual',stock)
    },
    setStockVehiculo({commit},stock){
        console.log(stock)
        commit('addstocks',stock)
    }
};

export default{
    state,
    getters,
    actions,
    mutations
}