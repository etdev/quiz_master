<template>
  <div class="question" v-if="question">
    <div class="question__content">
      <div v-html="contentHtml">
      </div>
    </div>

    <form class="form" v-on:submit.prevent>
      <div class="form__row">
        <label for="guess" class="form__label">Guess:</label>
        <input type="text" name="guess" v-model="guess" class="form__text-input" v-on:keyup.enter="checkAnswer">
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
import marked from 'marked';

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
  computed: {
    contentHtml() {
      return marked(this.question.content, { sanitize: true });
    },
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

<style lang="scss" :scoped>
@import "~assets/styles/base/_variables";
@import "~assets/styles/base/_mixins";

.question {
  @include flex-container;
}

.question__content {
  margin: 2rem 0;
  padding: 1rem 0;
}
</style>
