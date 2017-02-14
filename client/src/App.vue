<template>
  <div id="app">
    <header class="header header--main">
      <main-nav></main-nav>
    </header>

    <main>
      <transition name="fade">
        <router-view class="view"></router-view>
      </transition>
    </main>

    <main-footer>
    </main-footer>
  </div>
</template>

<script>
import MainNav from "components/MainNav";
import MainFooter from "components/MainFooter";

export default {
  components: { MainNav, MainFooter },
};

</script>

<style lang="scss" :scoped>
@import "assets/styles/base/variables";
@import "assets/styles/base/mixins";

.fade-enter-active, .fade-leave-active {
  transition: opacity .2s ease-in-out;
  opacity: 1;
}

.fade-enter, .fade-leave-active {
  opacity: 0
}

h1,
h2,
h3,
strong {
  color: #333;
}

#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  color: #555;
  font-family: 'Open Sans','Lato',Helvetica,sans-serif;
  font-weight: 500;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-size: 16px;

  @include media(xs) {
    font-size: 12px;
  }

  @include media(sm) {
    font-size: 14px;
  }
}
</style>
