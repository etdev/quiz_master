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
    <question-list/>
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

.home {
}
</style>
