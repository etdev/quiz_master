import VueRouter from 'vue-router';
import Home from 'components/Home';
import QuestionForm from 'components/QuestionForm';
import Question from 'components/Question';

export default new VueRouter({
  base: __dirname,
  routes: [
    {
      path: '/',
      component: Home,
    },
    {
      name: 'newQuestion',
      path: '/new_question',
      component: QuestionForm,
    },
    {
      path: '/question/:id',
      component: Question,
    },
    {
      name: 'editQuestion',
      path: '/question/:id/edit',
      component: QuestionForm,
    },
  ],
});

