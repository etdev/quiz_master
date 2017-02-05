<template>
  <div class="home">
    <h1>Welcome to QuizMaster</h1>
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
  @include outer-container;
}
</style>
