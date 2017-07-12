import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './components/App.vue';
// import Resource from 'vue-resource'
Vue.use(VueRouter)
// Router
Vue.router = new VueRouter({
    hashbang: false,
    linkActiveClass: 'active',
    mode: 'history',
    base: __dirname,
    routes: [{
        path: '/',
        name: 'default',
        component: require('./components/pages/Home.vue')
    }, {
        path: '/login',
        name: 'login',
        component: require('./components/pages/Login.vue'),
        meta: {auth: false}
    }, {
        path: '/login/:type',
        name: 'oauth2-type',
        component: require('./components/pages/Oauth2.vue')
    }, {
        path: '/register',
        name: 'register',
        component: require('./components/pages/Register.vue'),
        meta: {auth: false}
    }, {
        path: '/oauth1',
        name: 'oauth1',
        component: require('./components/pages/Oauth1.vue')
    }, {
        path: '/oauth2',
        name: 'oauth2',
        component: require('./components/pages/Oauth2.vue')
    }, {
        path: '/account',
        name: 'account',
        component: require('./components/pages/Account.vue'),
        meta: {auth: true}
    }, 
        // {
        // path: '/product/:product_id',
        // name: 'product',
        // component: require('./components/pages/admin/Product.vue'),
        //  children: [{
        //             path: 'info',
        //             name: 'admin-product-info',
        //             component: require('./components/pages/admin/ProductInfo.vue'),
        //             meta: {auth: undefined}
        //         }, {
        //             path: 'media',
        //             name: 'admin-product-media',
        //             component: require('./components/pages/admin/ProductMedia.vue')
        //         }]
        // }, 
    {
        path: '/async',
        name: 'async',
        component: function(resolve) { require(['./components/pages/Async.vue'], resolve); }
    }, {
        path: '/admin',
        name: 'admin',
        component: require('./components/pages/Admin.vue'),
        meta: {auth: 'admin'},
        children: [{
            path: 'products',
            name: 'admin-products',
            component: require('./components/pages/admin/Products.vue'),
            children: [{
                path: ':product_id',
                name: 'admin-product',
                component: require('./components/pages/admin/Product.vue'),
                children: [{
                    path: 'info',
                    name: 'admin-product-info',
                    component: require('./components/pages/admin/ProductInfo.vue'),
                    meta: {auth: undefined}
                }, {
                    path: 'media',
                    name: 'admin-product-media',
                    component: require('./components/pages/admin/ProductMedia.vue')
                }]
            }]
        }]
    }, {
        path: '/users',
        name: 'users',
        component: require('./components/pages/Users.vue'),
        meta: {auth: ['admin']}
    }, {
        path: '/products',
        name: 'products',
        component: require('./components/pages/Products.vue'),
        meta: {auth: ['user','admin']}
    }, {
        path: '/404',
        name: 'error-404',
        component: require('./components/pages/404.vue')
    }, {
        path: '/403',
        name: 'error-403',
        component: require('./components/pages/403.vue')
    }, {
        path: '/502',
        name: 'error-502',
        component: require('./components/pages/502.vue')
    }]
});

// import axios from 'axios';
import './vue-axios';
// Vue.$axios.defaults.baseURL = 'https://api-demo.websanova.com/api/v1';
// console.log(Vue.$axios);
// Http 
// Vue.use(Resource)
// Vue.http.options.emulateJSON = true
// Vue.config.productionTip = false
// Vue.http.options.root = 'https://api-demo.websanova.com/api/v1';

// Vue Auth
Vue.use(require('@websanova/vue-auth'), {
    auth: require('@websanova/vue-auth/drivers/auth/bearer.js'),
    // http: require('@websanova/vue-auth/drivers/http/vue-resource.1.x.js'),
    http: require('@websanova/vue-auth/drivers/http/axios.1.x.js'),
    router: require('@websanova/vue-auth/drivers/router/vue-router.2.x.js'),
    rolesVar: 'role',
    facebookOauth2Data: {
        clientId: '196729390739201'
    },
    googleOauth2Data: {
        clientId: '337636458732-tatve7q4qo4gnpfcenbv3i47id4offbg.apps.googleusercontent.com'
    }
});

// Start
var component = require('./components/App.vue');

component.router = Vue.router;

window.vm = new Vue(component).$mount('#app');