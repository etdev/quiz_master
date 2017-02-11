<template>
  <ul class="question-list">
    <question-item v-for="question in questions"
        :question="question"
    >
    </question-item>
  </ul>
</template>

<script>
import api from 'services/api';
import QuestionItem from 'components/QuestionItem';

export default {
  name: 'question-list',
  components: {
    QuestionItem,
  },
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

<style lang="scss" :scoped>
@import "src/assets/styles/vendor/neat/_neat.scss";

.question-list {
  @include outer-container;
  display: flex;
  flex-direction: column;
}

</style>
