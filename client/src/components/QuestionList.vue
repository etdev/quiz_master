<template>
  <ul class="question-list">
    <li v-for="question in questions" class="question">
      {{ question }}
      <router-link :to="answerQuestionPath(question)">
        Answer Question
      </router-link>
    </li>
  </ul>
</template>

<script>
import api from 'services/api';

export default {
  name: 'question-list',
  components: {},
  created() {
    this.getQuestions();
  },
  data() {
    return {
      questions: null,
    };
  },
  methods: {
    getQuestions() {
      api.getQuestions().then(
        (resp) => {
          this.questions = resp.data.questions;
        },
      );
    },
    answerQuestionPath(question) {
      return `/question/${question.id}`;
    },
  },
};
</script>

<style>
</style>
