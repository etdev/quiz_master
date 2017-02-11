<template>
  <li class="question-item" v-if="question">
    <div class="question-item__image-box">
      <img :src="getImage()">
    </div>

    <div class="question-item__info-box">
      <router-link :to="answerQuestionPath()" class="question-item__title link">
        {{ question.name }}
      </router-link>
      <div class="question-item__secondary-info-box">
        <div class="question-item__category">{{ question.category.name }}</div>
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
    getImage() {
      const images = [
        "laptop-ipad-organic-natural-159643.jpeg",
        "pexels-photo-160107.jpeg",
        "pexels-photo-257092.jpeg",
        "pexels-photo-270557.jpeg",
        "pexels-photo-293229.jpeg",
        "paint-notebook-brush-pencil-159657.jpeg",
        "pexels-photo-213769.jpeg",
        "pexels-photo-260234.jpeg",
        "pexels-photo-270700.jpeg",
        "pexels-photo-126345.jpeg",
        "pexels-photo-220325.jpeg",
        "pexels-photo-27986.jpg",
      ];

      const randomImage = images[Math.floor(Math.random() * images.length)];
      return "/static/" + randomImage;
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

.question-item__info-box {
  @include clearfix;
  height: 12rem;
  width: 100%;
  background: #fff;
  padding: 1rem 2rem;
}
</style>
