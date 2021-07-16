// state having some demo data
const state = {
    user:[],
};
const mutations = {
    useractive(state,payload){
      state.user = payload;   
    },
};
const getters = {
    getUser: (state) => state.user,
};
const actions = {
    usersession({commit},item){
      	axios.get(route('perfil.index')).then((response) => {
			commit('useractive',response.data)
		}).catch((error) => {
	       	alert(error.response.data.message)
		})
    },
};

export default{
    state,
    getters,
    mutations,
    actions
}