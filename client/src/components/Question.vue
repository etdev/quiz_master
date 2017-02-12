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
      <div class="question__btn-box--correct">
        <a class="btn btn--primary" v-on:click="backToQuestions">Back to Question List</a>
        <a class="btn btn--default" v-on:click="clearResultBox">Clear</a>
      </div>
    </div>

    <div class="question__result-box question__result-box--incorrect" v-if="result && !answerIsCorrect">
      <div class="question__btn-box--incorrect">
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

.question__content {
  padding: 1rem 0;

  @include media(xs) {
    padding: 0 1rem;
  }
}

.question__guess-box {
  padding: 1rem 0 4rem 0;

  @include media(xs) {
    padding: 1rem 1rem 4rem;
  }
}

.question__result-box {
  padding: 1rem 0 4rem 0;

  @include media(xs) {
    padding: 0 1rem;
    font-size: 1em;
  }
}

.question__result-box {
  display: flex;
  flex: 1;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  min-height: 32rem;
  margin-bottom: 4rem;
  margin-top: 4rem;
  border-radius: 4px;

  &--correct {
    background: url('/static/vectors/correct.png');
    background-size: cover;
    max-width: 100%;
  }

  &--incorrect {
    background: url('/static/vectors/incorrect.png');
    background-size: cover;
  }
}

.question__box-main-title {
  color: #fff;
  flex: 0;
  margin: 0;
}

.question__btn-box {
  margin-top: 14rem;
  display: relative;

  &--incorrect {
    position: relative;
    left: -20rem;
    top: 4rem;

    @include media(xs) {
      left: 0;
      top: 0;
    }
  }

}
</style>
