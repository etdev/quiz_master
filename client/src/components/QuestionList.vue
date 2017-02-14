<template>
  <div class="question-list-container">
    <ul class="question-list" v-if="questions">
      <question-item v-for="question in questions"
          :question="question"
          v-on:updateQuestions="getQuestions"
      >
      </question-item>
    </ul>

    <div v-if="hasNoQuestions" class="has-no-questions-box">
      Sorry, there are currently no questions available. But please Feel free to add your own!
    </div>

    <pagination
      :vm="paging"
      v-on:setPage="setPage"
    >
    </pagination>

  </div>
</template>

<script>
import api from 'services/api';
import QuestionItem from 'components/QuestionItem';
import Pagination from 'components/Pagination';
import PagingMixin from 'src/mixins/PagingMixin';

export default {
  name: 'question-list',
  components: {
    QuestionItem,
    Pagination,
  },
  created() {
    this.getQuestions();
  },
  mixins: [PagingMixin],
  data() {
    return {
      questions: null,
    };
  },
  methods: {
    getQuestions() {
      api.getQuestions(this.paging).then(
        (resp) => {
          this.questions = resp.data.questions;
          this.paging.update(resp.data.meta);
        },
      );
    },
    setPage(pageNum) {
      this.paging.setPage(pageNum);
      this.getQuestions();
    },
  },
  computed: {
    hasNoQuestions() {
      return this.questions && this.questions.length === 0;
    },
  },
};
</script>

<style lang="scss" :scoped>
@import "src/assets/styles/vendor/neat/_neat.scss";
@import "~assets/styles/base/variables";
@import "~assets/styles/base/mixins";

.question-list {
  @include outer-container;
  padding: 0 1rem;
}

.has-no-questions-box {
  padding: 1rem;
}

</style>
