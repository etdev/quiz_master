<template>
  <ul class="question-list">
    <li v-for="question in questions" class="question">
      {{ question }}
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
  },
};
</script>

<style>
</style>
