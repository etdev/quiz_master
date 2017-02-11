<template>
  <li class="question-item" v-if="question">
    <div class="question-item__thumbnail-box">
      <img src="http://lorempixel.com/120/120/">
    </div>

    <div class="question-item__info-box">
      <router-link :to="answerQuestionPath()" class="question-item__title">
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
  },
};
</script>

<style lang="scss" :scoped>
@import "~assets/styles/base/variables";

$bg-color-question-item: #fefefe;
$border-color-question-item: #eaeaea;
$thumbnail-height: 60px;
$thumbnail-width: $thumbnail-height;

.question-item {
  display: flex;
  background: $bg-color-question-item;
  padding: 1em;

  &:not(:last-of-type) {
    // border-bottom: 1px solid $border-color-question-item;
  }
}

.question-item__thumbnail-box {
  display: flex;
  justify-content: center;
  align-items: center;
  height: $thumbnail-height;
  width: $thumbnail-width;
  margin: 0 0.5em 0 0;

  img {
    max-height: $thumbnail-height;
    max-width: $thumbnail-width;
  }
}

.question-item__info-box {
  flex: 1;
}

.question-item__secondary-info-box {
  display: flex;
}

.question-item__category {
  border: 1px solid $border-color-question-item;
  padding: 0.25rem 0.5rem;;
  margin-top: 0.5rem;
  font-size: 0.8em;
  border-radius: 4px;
  flex: 0;
}

.question-item__title {
  color: $action-color;
  font-weight: bold;
  flex-grow: 0;
}

.question__secondary-info {
  font-size: 0.8em;
  padding-top: 0.5em;
  color: #444;
}
</style>
