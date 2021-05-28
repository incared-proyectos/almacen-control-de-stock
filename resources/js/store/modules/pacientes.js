// state having some demo data
const state = {
    notes:[
        {
            id:1,
            title:'Title One'
        },
        {
            id:2,
            title: 'Title Two'
        }
    ]
};
let num = 20;

//getters set data to allTodos and we can call this //"allTodos" in component file
const getters = {
    allTodos: (state) => state.notes,
    num:(state)=>num
};

const actions = {};
const mutations = {};

export default{
    state,
    getters,
    actions,
    mutations
}