<template>
  <div class="home">
    <div class="banner">
      <section class="banner__inner">
        <h1 class="banner__main-title">Welcome to QuizMaster!</h1>
        <div class="banner__btn-box">
          <a class="btn btn--primary banner__btn">Ask a Question</a>
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
