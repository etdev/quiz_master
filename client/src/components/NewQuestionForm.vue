<template>
  <div class="new-question-form">
    <h1>New Question</h1>
    <form class="form">
      <label for="content" class="form__label">Content:</label>

      <markdown-editor></markdown-editor>

      <div class="form__row">
        <label for="answer" class="form__label">Answer:</label>
        <input type="text" name="answer" v-model="answer" class="form__text-input">
      </div>
      <div class="form__row">
        <a class="btn form__submit-btn" v-on:click="postQuestion">
          Submit
        </a>
      </div>
    </form>
  </div>
</template>

<script>
import api from 'services/api';
import MarkdownEditor from 'components/MarkdownEditor';

export default {
  name: 'question-list',
  components: {
    MarkdownEditor,
  },
  created() { },
  data() {
    return {
      content: '',
      answer: '',
    };
  },
  methods: {
    postQuestion() {
      api.postQuestion(this.question).then(
        (resp) => {
          this.$router.push(`/question/${resp.data.question.id}`);
        },
        () => {
          console.log("FAILED");
        },
      );
    },
  },
  computed: {
    question() {
      return {
        content: this.content,
        answer: this.answer,
      };
    },
  },
};
</script>

<style lang="scss">
@import "src/assets/styles/vendor/neat/_neat.scss";

.new-question-form {
  @include outer-container;
}
</style>
