<template>
  <div class="pagination">

    <ul class="pagination__item-list">
      <li v-for="targetPage in targetPages()">
        <a class="pagination__link" 
          v-on:click="setPage(targetPage)" 
          v-bind:class="{ active: isActive(targetPage) }"
        >
          {{ targetPage }}
        </a>
      </li>
    </ul>

  </div>
</template>

<script>
export default {
  name: 'pagination',
  components: { },
  created: function _created() { },
  props: ['items', 'vm'],
  data() {
    return { };
  },
  methods: {
    setPage(page) {
      this.$emit('setPage', page);
    },
    targetPages() {
      const page = parseInt(this.vm.page, 10);

      return [page - 2, page - 1, page, page + 1, page + 2]
        .filter(p => p > 0)
        .filter(p => ((p - 1) * this.vm.perPage) <= this.vm.totalCount);
    },
    isActive(p) {
      return p === this.vm.page;
    },
  },
};
</script>

<style lang='scss' :scoped>
@import "~assets/styles/base/variables";
@import "~assets/styles/base/mixins";

.pagination {
  display: flex;
  justify-content: center;
}

.pagination__item-list {
  display: flex;
  flex-direction: row;
  justify-content: space-between;

  li:not(:last-of-type) {
    .pagination__link {
      margin-right: 2rem;
    }
  }
}

.pagination__link {
  display: flex;
  justify-content: center;
  text-align: center;
  padding-top: 6px;
  align-items: center;
  height: 2.4rem;
  width: 2.4rem;
  border: 1px solid #d2d2d2;
  border-radius: 4px;
  display: block;
  cursor: pointer;
  color: #999;

  &:hover {
    background: #F4F4F4;
  }

  &.active {
    color: $action-color;
    font-weight: bold;
    border: 1px solid #999;
  }
}
</style>
