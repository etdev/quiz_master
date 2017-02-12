<template>
  <div class="question" v-if="question">
    <banner :backgroundImage="question.category.image_url">
      <h1 class="banner__main-title" slot="main-title">
        {{ question.name }}
      </h1>
      <h3 class="banner__sub-title" slot="sub-title">
        {{ question.description }}
      </h3>
    </banner>

    <div class="question__result-box question__result-box--correct" v-if="answerIsCorrect">
      <h1 class="question__box-main-title">Congratulations!! That is correct.</h1>
      <div class="question__btn-box">
        <a class="btn btn--primary" v-on:click="backToQuestions">Back to Question List</a>
        <a class="btn btn--default" v-on:click="clearResultBox">Clear</a>
      </div>
    </div>

    <div class="question__result-box question__result-box--incorrect" v-if="result && !answerIsCorrect">
      <h1 class="question__box-main-title">Sorry, that is incorrect.</h1>
      <div class="question__btn-box">
        <a class="btn btn--primary" v-on:click="backToQuestions">Back to Question List</a>
        <a class="btn btn--default" v-on:click="clearResultBox">Try Again</a>
      </div>
    </div>

    <section class="question__content">
      <div v-html="contentHtml">
      </div>
    </section>

    <section class="question__guess-box">
      <form class="form" v-on:submit.prevent>
        <div class="form__row">
          <input type="text" name="guess" v-model="guess" class="form__text-input" v-on:keyup.enter="checkAnswer">
        </div>
        <div class="form__row">
          <a class="btn form__submit-btn" v-on:click="checkAnswer">
            Check Answer
          </a>
        </div>
      </form>
    </section>

  </div>
</template>

<script>
import api from 'services/api';
import marked from 'marked';
import Banner from 'components/Banner';

export default {
  name: 'question',
  components: {
    Banner,
  },
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
    answerIsCorrect() {
      return this.result === "correct";
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
    clearResultBox() {
      this.result = null;
    },
    backToQuestions() {
      this.$router.push('/');
    },
  },
};
</script>

<style lang="scss" :scoped>
@import "src/assets/styles/vendor/neat/_neat.scss";
@import "~assets/styles/base/_variables";
@import "~assets/styles/base/_mixins";

.question {
  flex: 1;
}

.question__content,
.question__guess-box,
.question__result-box {
  @include outer-container;
}

.question_content {
  padding: 1rem 0;
}

.question__guess-box {
  padding: 1rem 0 4rem 0;
}

.question__result-box {
  padding: 1rem 0 4rem 0;
}

.question__result-box {
  display: flex;
  flex: 1;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  min-height: 20rem;
  margin-bottom: 4rem;
  margin-top: 4rem;
  border-radius: 4px;

  &--correct {
    background: $success-color;
  }

  &--incorrect {
    background: $failure-color;
  }
}

.question__box-main-title {
  color: #fff;
  flex: 0;
  margin: 0;
}

.question__btn-box {
  margin-top: 1rem;
}
</style>
