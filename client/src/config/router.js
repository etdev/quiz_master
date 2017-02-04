import VueRouter from 'vue-router';
import Home from 'components/Home';

export default new VueRouter({
  base: __dirname,
  routes: [
    {
      path: '/',
      component: Home,
    },
  ],
});

