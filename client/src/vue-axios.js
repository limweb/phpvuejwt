import Vue from 'vue'
import axios from 'axios'

Vue.axios = axios
// Vue.axios.defaults.baseURL = 'https://api-demo.websanova.com/api/v1'; 
Vue.axios.defaults.baseURL = 'http://127.0.0.1:8000/api/v1'; 
Object.defineProperties(Vue.prototype, {
  axios: {
    get() {
      return axios
    }
  },

  $http: {
    get() {
      return axios
    }
  }

})

