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

<style lang="scss">
@import "src/assets/styles/vendor/neat/_neat.scss";
@import "~assets/styles/base/variables";
</style>
