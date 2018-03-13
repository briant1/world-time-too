/* Vue */
import Vue from 'vue'

/* App component */
import App from './components/app.vue'
import axios from 'axios'
import router from './router'
import VModal from 'vue-js-modal'

Vue.use(VModal, { dialog: true })
Vue.use(require('vue-moment'));


let instance = axios.create({
    headers: {
        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    }
})
global.axios = instance

global.router = router

document.addEventListener('DOMContentLoaded', () => {
    //Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

    var element = document.getElementById("app")
    if (element != null) {
    /* eslint-disable no-new */
    new Vue({
        el: element,
        router,
        render: h => h(App)
})
}

})
