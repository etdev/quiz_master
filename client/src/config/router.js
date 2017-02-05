import VueRouter from 'vue-router';
import Home from 'components/Home';
import NewQuestionForm from 'components/NewQuestionForm';
import Question from 'components/Question';

export default new VueRouter({
  base: __dirname,
  routes: [
    {
      path: '/',
      component: Home,
    },
    {
      path: '/new_question',
      component: NewQuestionForm,
    },
    {
      path: '/question/:id',
      component: Question,
    },
  ],
});

