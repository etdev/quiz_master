<template>
  <nav class="nav nav--main">
    <div class="nav__app-logo-box">
      <router-link class="nav__app-logo" to="/" exact>QuizMaster</router-link>
    </div>
    <ul class="nav__link-list">
      <li class="nav__link-list-item">
        <router-link class="nav__link-list-link" to="/" exact>Home</router-link>
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

<style>
</style>
