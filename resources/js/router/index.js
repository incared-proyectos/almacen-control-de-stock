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
            {

              path: 'edit/:id',
              component: require('@/pages/Vehiculos/Edit.vue').default
            },
 
        ]
    },
    {
        path: '/clientes',
        component: require('@/pages/App.vue').default,
        meta: {
            requiresAuth: true,
        }
        ,
        children: [
            {

              path: '',
              component: require('@/pages/Clientes/Index.vue').default

            },
            {

              path: 'create',
              component: require('@/pages/Clientes/Create.vue').default
            },
            {

              path: 'edit/:id',
              component: require('@/pages/Clientes/Edit.vue').default
            }

            
        ]
    },
    {
        path: '/ventas_clientes',
        component: require('@/pages/App.vue').default,
        meta: {
            requiresAuth: true,
        },
        children: [
            {

              path: '',
              component: require('@/pages/Ventas_clientes/Index.vue').default

            },
            {

              path: 'create',
              component: require('@/pages/Ventas_clientes/Create.vue').default
            }
            ,
            {

              path: 'edit/:id',
              component: require('@/pages/Ventas_clientes/Edit.vue').default
            }
            

            
        ]
    },
    {
        path: '/reportes',
        component: require('@/pages/App.vue').default,
        meta: {
            requiresAuth: true,
        },
        children: [
            {

              path: 'vehiculos',
              component: require('@/pages/Reportes/Vehiculos.vue').default

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