<template>
  <div class="markdown-editor">
    <div class="markdown-editor__input-box">
      <div class="markdown-editor__label">
        Your Question
      </div>
      <textarea
        class="markdown-editor__input"
        v-on:input="updateContent"
        :value="inputMarkdown"
        >
      </textarea>
    </div>
    <div class="markdown-editor__preview-box">
      <div class="markdown-editor__label">
        Preview
      </div>
      <div
        class="markdown-editor__preview"
        v-html="compiledHtml"
        >
      </div>
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

$min-editor-height: 40rem;
$min-editor-height-xs: 30rem;

.markdown-editor {
  display: flex;

  @include media(xs) {
    flex-direction: column;
  }
}

.markdown-editor__input-box,
.markdown-editor__preview-box {
  display: flex;
  flex-direction: column;
  flex: 1;
}

.markdown-editor__label {
  min-height: 3rem;
  line-height: 3rem;
}

.markdown-editor__preview {
  flex: 1;
  border: 1px solid #f8f8f8;
  padding: 1.5rem;
  min-height: $min-editor-height;

  ul {
    margin-left: 1.5rem;
    list-style-type: disc;
  }

  ol {
    margin-left: 1em;
    list-style-type: decimal;
  }

  @include media(xs) {
    min-height: $min-editor-height-xs;
  }
}

.markdown-editor__input {
  border: none;
  resize: none;
  outline: none;
  flex: 1;
  min-height: $min-editor-height;
  padding: 1.5rem;
  background-color: #f6f6f6;
  font-family: 'Monaco', courier, monospace;
  overflow: visible;

  @include media(xs) {
    min-height: $min-editor-height-xs;
  }
}

code {
  color: #f66;
}
</style>
