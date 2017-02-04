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

<style>
</style>
