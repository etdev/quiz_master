<template>
  <section class="banner" :style="{ background: backgroundCss(), backgroundSize: 'cover' }">
    <div class="banner__inner">
      <slot name="main-title"></slot>
      <slot name="sub-title"></slot>
      <slot name="btn-box"></slot>
    </div>
  </section>
</template>

<script>
export default {
  name: 'banner',
  props: ['backgroundImage'],
  components: {
  },
  data() {
    return { };
  },
  methods: {
    backgroundCss() {
      return `linear-gradient(
        rgba(0, 0, 30, 0.45),
        rgba(0, 0, 30, 0.45)
      ),
url("${this.backgroundImage}")`;
    },
  },
};
</script>

<style lang="scss" :scoped>
@import "~assets/styles/vendor/neat/neat";
@import "~assets/styles/base/variables";
@import "~assets/styles/base/mixins";


.banner {
  display: flex;
  height: 30rem;
  background-size: cover !important;

  &__inner {
    @include outer-container;
    display: flex;
    height: 30rem;
    flex-direction: column;
    justify-content: center;
  }

  &__main-title {
    padding: 2rem 0;
    font-size: 3em;
    margin: 0;
    color: #fff;
    text-align: center;

    @include media(xs) {
      font-size: 2.6em;
      line-height: 1.5;
      padding: 1em 0.5em;
    }
  }

  &__sub-title {
    padding: 0 0 2.5rem 0;
    margin: 0;
    font-size: 1.4em;
    font-weight: 400;
    color: #fff;
    letter-spacing: 1px;
    text-align: center;
    font-family: 'Lato';

    @include media(xs) {
      padding-left: 0.5em;
      padding-right: 0.5em;
    }
  }

  &__btn-box {
    display: flex;
    justify-content: center;
  }

  &__btn {
    &:not(:first-of-type) {
      margin-left: 1rem;
    }
  }
}
</style>
