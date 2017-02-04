<template>
  <div id="app">
    <header>
      <main-nav/>
    </header>
    <main>
      <transition name="fade" mode="out-in">
        <router-view class="view"></router-view>
      </transition>
    </main>
  </div>
</template>

<script>
import MainNav from "components/MainNav";

export default {
  components: { MainNav },
};

</script>

<style>
</style>
