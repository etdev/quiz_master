<template>
  <div class="home">
    <div class="banner">
      <section class="banner__inner">
        <h1 class="banner__main-title">Simple on the surface, with more under the hood.</h1>
        <h3 class="banner__secondary-title">QuizMaster helps you keep track of all the questions and answers you've been wondering about</h3>
        <div class="banner__btn-box">
          <router-link class="btn btn--primary banner__btn" to="/new_question">
            Ask a Question
          </router-link>
          <a class="btn btn--default banner__btn">View Questions</a>
        </div>
      </section>
    </div>
    <div class="panel">
      <div class="panel__heading">
        Top Questions
      </div>
      <div class="panel__body">
        <question-list/>
      </div>
    </div>
  </div>
</template>

<script>
import QuestionList from 'components/QuestionList';

export default {
  name: 'home',
  components: {
    QuestionList,
  },
  data() {
    return { };
  },
  methods: { },
};
</script>

<style lang="scss">
@import "src/assets/styles/vendor/neat/_neat.scss";
@import "~assets/styles/base/variables";

.home {
  background-color: $bg-color-default;
  padding-bottom: 2rem;
  flex: 1;
}
</style>
