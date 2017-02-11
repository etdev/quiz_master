<template>
  <div class="markdown-editor">
    <textarea
       class="markdown-editor__input"
       v-on:input="updateContent"
       :value="inputMarkdown"
      >
    </textarea>
    <div
       class="markdown-editor__preview"
       v-html="compiledHtml"
      >
    </div>
  </div>
</template>

<script>
import marked from 'marked';

export default {
  data() {
    return { };
  },
  props: ['input-markdown'],
  computed: {
    compiledHtml() {
      return marked(this.inputMarkdown, { sanitize: true });
    },
  },
  methods: {
    updateContent(e) {
      this.$emit('updateContent', e.target.value);
    },
  },
};
</script>

<style lang="scss" :scoped=true>
@import "~assets/styles/base/_variables";
@import "~assets/styles/base/_mixins";

.markdown-editor {
  display: flex;
  flex-wrap: wrap;
  border: 1px solid $border-color-light;
}

.markdown-editor__preview {
  padding: 0.5rem 1.5rem;
}

.markdown-editor__input {
  border: none;
  resize: none;
  outline: none;
  padding: 1.5rem;
  background-color: #f6f6f6;
  font-family: 'Monaco', courier, monospace;
  flex-shrink: 0;
  min-width: 30rem;
}

code {
  color: #f66;
}
</style>
