<template>
  <li class="question-item" v-if="question">
    <div class="question-item__image-box">
      <img :src="question.category.image_url">
    </div>

    <div class="question-item__info-box">
      <router-link :to="answerQuestionPath()" class="question-item__title link">
        {{ question.name }}
      </router-link>
      <div class="question-item__description">
        <div class="question-item__secondary-info-box">
          <div class="question-item__category">{{ question.category.name }}</div>
        </div>
        {{ question.description }}
      </div>
    </div>
  </li>
</template>

<script>
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

  @include span-columns(3);
  &:nth-of-type(4n) {
    @include omega;
  }

  @include media(sm) {
    @include span-columns(6);
    &:nth-of-type(2n) {
      @include omega;
    }

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

  img {
    height: 100%;
  }

  @include media(sm) {
    img {
      width: 100%;
      height: auto;
    }
  }

  @include media(xs) {
    img {
      width: 100%;
      height: auto;
    }
  }
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
</style>
