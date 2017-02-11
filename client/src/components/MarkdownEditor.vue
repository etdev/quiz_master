<template>
  <div class="markdown-editor">
    <textarea
       class="markdown-editor__input"
       v-model="inputMarkdown"
      >
    </textarea>
    <div
       class="markdown-editor__preview"
       v-html="compiledMarkdown"
      >
    </div>
  </div>
</template>

<script>
import _ from 'lodash';
import marked from 'marked';

export default {
  data() {
    return {
      inputMarkdown: '# hello',
    };
  },
  computed: {
    compiledMarkdown() {
      return marked(this.inputMarkdown, { sanitize: true });
    },
  },
  methods: {
    update: _.debounce((e) => {
      this.inputMarkdown = e.target.value;
    }, 300),
  },
};
</script>

<style lang="scss">
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
