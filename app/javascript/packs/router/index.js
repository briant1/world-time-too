import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from '../components/dashboard.vue'
import Search from '../components/search.vue'

Vue.use(Router)

const router = new Router({
    routes: [
        {
            path: '/dashboard',
            component: Dashboard
        },
        {
            path: '/dashboard/search',
            component: Search
        },
    ],
    mode: 'history',
})


export default router

