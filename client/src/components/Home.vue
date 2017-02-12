<template>
  <div class="home">
    <banner :background-image="mainBannerImage()">
      <h1 class="banner__main-title" slot="main-title">
        The Questions we ask make us who we are.
      </h1>
      <h3 class="banner__sub-title" slot="sub-title">
        QuizMaster helps you keep track of all the questions you've been wondering about.
      </h3>
      <div class="banner__btn-box" slot="btn-box">
        <router-link class="btn btn--primary banner__btn" to="/new_question">
          Ask a Question
        </router-link>
        <a class="btn btn--default banner__btn" v-on:click="scrollToQuestions">
          View Questions
        </a>
      </div>
    </banner>

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
import Banner from 'components/Banner';

export default {
  name: 'home',
  components: {
    QuestionList,
    Banner,
  },
  data() {
    return { };
  },
  methods: {
    mainBannerImage() {
      return "/static/main_banner.jpg";
    },
    scrollToQuestions() {
      this.$el.querySelector(".panel").scrollIntoView({ behavior: "smooth" });
    },
  },
};
</script>

<style lang="scss" :scoped>
@import "src/assets/styles/vendor/neat/_neat.scss";
@import "~assets/styles/base/variables";

.home {
  background-color: $bg-color-default;
  padding-bottom: 2rem;
  flex: 1;
}
</style>
