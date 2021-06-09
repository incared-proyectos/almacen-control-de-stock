// state having some demo data
const state = {
    fechasearch:null,
};
const mutations = {
    addvalue(state,payload){
      state.fechasearch = payload
     
    },
};
const getters = {
    fechaval: (state) => state.fechasearch,
};


export default{
    state,
    getters,
    mutations
}