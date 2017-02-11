<template>
  <div class="markdown-helper">
    Tip: This editor uses <a class="markdown-helper__link" :href="markdownExplanationUrl" target="_blank">Markdown</a>.  Please see <a class="markdown-helper__link" :href="markdownGuideUrl" target="_blank">this guide</a> for help
  </div>
</template>

<script>
export default {
  name: 'markdown-helper',
  data() {
    return {
      markdownExplanationUrl: "https://en.wikipedia.org/wiki/Markdown",
      markdownGuideUrl: "https://gist.github.com/lieldulev/2848574#file-readme-md",
    };
  },
  methods: { },
};
</script>

<style lang="scss" :scoped=true>
@import "~assets/styles/base/_variables";
@import "~assets/styles/base/_mixins";

.markdown-helper {
  line-height: 3rem;
}

.markdown-helper__link {
  display: inline;
  color: #333;
  text-decoration: underline;
}
</style>
