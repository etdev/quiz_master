import Vue from 'vue';
import VueRouter from 'vue-router';
import 'assets/styles/vendor/neat/_neat.scss';
import 'assets/styles/main.scss';
import App from './App';
import router from './config/router';

// basic global styles
Vue.use(VueRouter);
Vue.config.env = process.env;

/* eslint-disable no-new */
new Vue({
  router,
  el: '#app',
  template: '<App/>',
  components: { App },
});
