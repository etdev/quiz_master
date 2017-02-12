<template>
  <div class="question-form">
    <banner :backgroundImage="newQuestionBackgroundImage()">
      <h1 class="banner__main-title" slot="main-title">
        Adding a Question to the Archives
      </h1>
      <h3 class="banner__sub-title" slot="sub-title">
        We appreciate your contribution.  Please enter your data below.
      </h3>
    </banner>
    <div class="question-form__inner">

      <h1 class="question-form__main-title">Question Info</h1>
      <form class="form">
        <div class="question__basic-info">
          <div class="form__row">
            <label for="name" class="form__label">
              Give your question a name:
            </label>
            <input type="text" name="name" v-model="name" class="form__text-input" required="true" placeholder="Name">
          </div>

          <div class="form__row">
            <label for="description" class="form__label">
              A quick description of your question:
            </label>
            <input type="text" name="description" v-model="description" class="form__text-input" required="true" placeholder="Description">
          </div>

          <div class="form__row">
            <label for="answer" class="form__label">
              The answer to your question:
            </label>
            <input type="text" name="answer" v-model="answer" class="form__text-input" required="true" placeholder="Answer">
          </div>

          <div class="form__row">
            <label for="category_id" class="form__label">Add a category: </label>
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
        </div>

        <h1 class="question-form__main-title">Question Content</h1>
        <div class="markdown-editor-container">
          <markdown-editor
            :inputMarkdown="content"
            v-on:updateContent="setContent"
            >
          </markdown-editor>

          <markdown-helper/>
        </div>

        <div class="form__row">
          <a class="btn form__submit-btn" v-on:click="postQuestion">
            Submit Question
          </a>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import api from 'services/api';
import MarkdownEditor from 'components/MarkdownEditor';
import MarkdownHelper from 'components/MarkdownHelper';
import Multiselect from 'vue-multiselect';
import Banner from 'components/Banner';

export default {
  name: 'question-list',
  components: {
    MarkdownEditor,
    MarkdownHelper,
    Multiselect,
    Banner,
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
    newQuestionBackgroundImage() {
      return "/static/categories/new_question.jpg";
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

.question-form {
  flex: 1;
  flex-direction: column;
  justify-content: center;
  margin: 0 auto 4rem auto;
}

.question-form__inner {
  @include flex-container;
  margin: auto;
}

.markdown-editor-container {
  margin-top: 2rem;
}

.question-form__main-title {
  margin-bottom: 0;
}

.question__basic-info {
  border-bottom: 1px solid #e8e8e8;
  padding: 1rem 0 2.5rem;
}

</style>
