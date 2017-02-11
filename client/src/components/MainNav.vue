<template>
  <nav class="main-nav">
    <div class="main-nav__app-logo-box">
      <i class="fa fa-mortar-board main-nav__app-logo-icon"></i>
      <router-link class="main-nav__app-logo-text" to="/" exact>QuizMaster</router-link>
    </div>
    <ul class="main-nav__link-list">
      <li class="main-nav__link-list-item">
        <router-link class="main-nav__link-list-link" to="/" exact>Home</router-link>
      </li>
      <li class="main-nav__link-list-item">
        <router-link class="main-nav__link-list-link" to="/new_question" exact>New Question</router-link>
      </li>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'main-nav',
  components: {},
  data() {
    return {};
  },
  methods: {},
};
</script>

<style lang="scss" :scoped>
@import "src/assets/styles/vendor/neat/_neat.scss";
@import "~assets/styles/base/_variables";
@import "~assets/styles/base/_mixins";

.main-nav {
  display: flex;
  justify-content: space-between;
  max-width: 1200px;
  flex-grow: 1;

  @include media(xs) {
    min-height: $main-nav-height;
    padding: 0 0.5rem;
  }
}

.main-nav__app-logo-box {
  display: flex;
  flex: 0;
  font-size: 1.6rem;
  font-weight: bold;
  padding: 1rem 0;
}

.main-nav__app-logo-icon {
  flex: 0;
  align-self: center;
  margin-right: 0.5rem;
  font-size: 1.6rem;
  color: $text-color-mid-gray;
}

.main-nav__app-logo-text {
  color: $text-color-mid-gray;
  font-family: 'Lato', sans-serif;
  font-size: 0.9em;
  font-weight: 700;
  letter-spacing: 2px;
  text-transform: uppercase;
  @include animate-default(color);
  @include activated {
    color: darken($text-color-mid-gray, 14%);
  }
}

.main-nav__link-list {
  display: flex;
}

.main-nav__link-list-item {
  display: flex;
  box-sizing: border-box;
  flex-direction: column;
  justify-content: center;
}

.main-nav__link-list-link {
  display: flex;
  align-items: center;
  justify-content: center;
  flex: 1;
  margin: auto;
  padding: 0 1rem;
  color: $text-color-mid-gray;
  font-weight: bold;
  @include animate-default(color);

  @include activated {
    color: darken($text-color-mid-gray, 14%);
  }
}
</style>
