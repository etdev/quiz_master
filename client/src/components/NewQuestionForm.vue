<template>
  <div class="new-question-form">
    <h1 class="new-question-form__main-title">Ask a Question</h1>
    <form class="form">
      <markdown-editor
        :inputMarkdown="content"
        v-on:updateContent="setContent"
        >
      </markdown-editor>

      <markdown-helper/>

      <div class="form__row">
        <label for="name" class="form__label">
          Name:
        </label>
        <input type="text" name="name" v-model="name" class="form__text-input" required="true">
      </div>
      <div class="form__row">
        <label for="answer" class="form__label">
          Correct Answer:
        </label>
        <input type="text" name="answer" v-model="answer" class="form__text-input" required="true">
      </div>

      <div class="form__row">
        <label for="category_id" class="form__label">Category: </label>
        <multiselect
            class="form__select-input"
            v-model="selectedCategory"
            :options="categoryOptions"
            placeholder="Choose a category..."
            label="name"
            track-by="name"
            >
        </multiselect>
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
import MarkdownHelper from 'components/MarkdownHelper';
import Multiselect from 'vue-multiselect';

export default {
  name: 'question-list',
  components: {
    MarkdownEditor,
    MarkdownHelper,
    Multiselect,
  },
  created() {
    this.fetchCategories();
  },
  data() {
    return {
      content: '# hello',
      answer: '',
      name: '',
      selectedCategory: {},
      categoryOptions: [],
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
    setContent(newContent) {
      this.content = newContent;
    },
    fetchCategories() {
      api.getCategories().then(
        (resp) => {
          this.categoryOptions = resp.data.categories;
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
        name: this.name,
        category_id: this.selectedCategory.id,
      };
    },
  },
};
</script>

<style lang="scss">
@import "src/assets/styles/base/mixins";

.new-question-form {
  @include flex-container;
  margin: auto;
}
</style>
