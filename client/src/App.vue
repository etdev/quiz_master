<template>
  <div id="app">
    <header class="header header--main">
      <main-nav></main-nav>
    </header>

    <main class="main">
      <transition name="fade" mode="out-in">
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

<style>
</style>
