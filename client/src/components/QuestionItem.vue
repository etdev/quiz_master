<template>

  <li class="question-item" v-if="question">
    <div class="question-item__image-box" :style="backgroundImageStyle(question)">
      <router-link :to="answerQuestionPath()" class="question-item__block-link">
      </router-link>
    </div>

    <div class="question-item__info-box">
      <router-link :to="answerQuestionPath()" class="question-item__title link">
        {{ question.name }}
      </router-link>
      <div class="question-item__description">
        <div class="question-item__secondary-info-box">
          <div class="question-item__category">{{ question.category.name }}</div>
        </div>
        {{ truncatedDescription }}
      </div>
      <div class="question-item__btns-box">
        <router-link class="btn btn--primary btn--sm question-item__btn" :to="'/question/' + question.id + '/edit'">
          Edit
        </router-link>
        <a class="btn btn--default--danger btn--sm question-item__btn" v-on:click="deleteQuestion">
          Delete
        </a>
      </div>
    </div>
  </li>
</template>

<script>
import api from 'services/api';
import _ from 'lodash';

export default {
  name: 'question-item',
  props: ['question'],
  components: {},
  data() {
    return { };
  },
  methods: {
    answerQuestionPath() {
      return `/question/${this.question.id}`;
    },
    backgroundImageStyle(question) {
      return { 'background-image': 'url(' + question.category.image_url + ')' };
    },
    deleteQuestion() {
      api.deleteQuestion(this.question).then(
        () => {
          this.$emit('updateQuestions');
        },
      );
    },
  },
  computed: {
    truncatedDescription() {
      return _.truncate(this.question.description, { length: 120 });
    },
  },
};
</script>

<style lang="scss" :scoped>
@import "src/assets/styles/vendor/neat/_neat.scss";
@import "~assets/styles/base/variables";
@import "~assets/styles/base/mixins";

$border-color-question-item: #eaeaea;

.question-item {
  border-radius: 4px;
  border: 1px solid $border-color-question-item;
  overflow: hidden;
  margin-bottom: 1.6rem;

  @include span-columns(4);
  @include omega(3n);

  @include media(sm) {
    @include span-columns(6);
    @include omega-reset(3n);
    @include omega(2n);
  }

  @include media(xs) {
    @include span-columns(12);
    @include omega;
  }

  box-shadow: 0 5px 15px rgba(0,0,0,.05);
}

.question-item__image-box {
  @include clearfix;
  height: 12rem;
  width: 100%;
  overflow: hidden;
  background-size: cover;
}

.question-item__title {
  line-height: 1.4em;
}

.question-item__category {
  border: 1px solid #e6e6e6;
  color: #222;
  padding: 0rem 0.4rem;
  line-height: 1.8;
  background: #eaeaea;
  margin: 0;
  display: inline-block;
  font-size: 0.7em;
  border-radius: 4px;
}

.question-item__info-box {
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  height: 21rem;
  font-weight: 300;
  font-size: 1.2em;
  line-height: 1.8em;
  width: 100%;
  color: #444;
  background: #fff;
  padding: 1rem 2rem;
}

.question-item__secondary-info-box {
  display: inline;
  padding-right: 0.6rem;
}

.question-item__btns-box {
  margin: 0;
  display: flex;
  flex-shrink: 0;

  .question-item__btn {
    flex: 1;
    text-align: center;
    &:last-of-type {
      margin-left: 1rem;
    }
  }
}

.question-item__block-link {
  display: block;
  height: 100%;
  width: 100%;
}
</style>
