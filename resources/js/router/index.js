import VueRouter from 'vue-router'
//component: () => import( "@/pages/Pruebas.vue"), IMPORT LAZY LOADING FAST

let routes = [
	{
		path: '/home',
        component: require('@/pages/Home.vue').default,
        meta: {
            requiresAuth: true,
        }
	},
    {
        path: '/almacen',
        component: require('@/pages/Almacen/Index.vue').default,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/productos',
        component: require('@/pages/Productos/Index.vue').default,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/rutas',
        component: require('@/pages/Rutas/Index.vue').default,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/vehiculos',
        component: require('@/pages/App.vue').default,
        meta: {
            requiresAuth: true,
        },
        children: [
            {

              path: '',
              component: require('@/pages/Vehiculos/Index.vue').default

            },
            {

              path: 'create',
              component: require('@/pages/Vehiculos/Create.vue').default
            },
        ]
    },
     

];
 
 
export default new VueRouter({
    base:base_path_vue_router,
    routes,
    linkActiveClass: "active",
    mode: "history"
});