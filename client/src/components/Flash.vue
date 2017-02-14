<template>
  <transition name="fade">
    <div :class="className()" v-if="vm.visible">
      <div class="flash__message">
        {{ vm.message }}
      </div>
      <slot></slot>
    </div>
  </transition>
</template>

<script>
export default {
  name: 'flash',
  components: { },
  props: ['flash'],
  data() {
    return {
      vm: this.flash,
    };
  },
  methods: {
    className() {
      return `flash flash--${this.vm.type || 'success'}`;
    },
  },
};
</script>

<style lang="scss" :scoped>
@import "~assets/styles/base/variables";

$flash-height: 50px;

.flash {
  display: flex;
  background: #bbb;
  color: #000;
  min-height: $flash-height;

  &--success {
    background-color: $success-color;
  }

  &--failure {
    background-color: $failure-color;
  }
}

.flash__message {
  flex: 1;
  align-self: center;
  height: 100%;
  text-align: center;
  color: #fff;
}
</style>
