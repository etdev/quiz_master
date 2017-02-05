<template>
  <div class="question" v-if="question">
    <div class="question__content">
      <h3>{{ question.content }}</h3>
    </div>

    <form class="form">
      <div class="form__row">
        <label for="guess" class="form__label">Guess:</label>
        <input type="text" name="guess" v-model="guess" class="form__text-input">
      </div>
      <div class="form__row">
        <a class="btn form__submit-btn" v-on:click="checkAnswer">
          Submit
        </a>
      </div>
    </form>

    <div class="question__result">
      {{ result }}
    </div>
  </div>
</template>

<script>
import api from 'services/api';

export default {
  name: 'question',
  components: {},
  created() {
    this.getQuestion(this.$route.params.id);
  },
  data() {
    return {
      question: null,
      guess: '',
      result: null,
    };
  },
  methods: {
    getQuestion(id) {
      api.getQuestion(id).then(
        (resp) => {
          this.question = resp.data.question;
        },
      );
    },
    checkAnswer() {
      api.checkAnswer(this.question, this.guess).then(
        (resp) => {
          this.result = resp.data.result;
        },
      );
    },
  },
};
</script>

<style lang="scss">
@import "src/assets/styles/vendor/neat/_neat.scss";

.question {
  @include outer-container;
}
</style>
