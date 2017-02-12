export default {
  created() { },
  data() {
    return {
      paging: this.generateBlankPagingObject(),
    };
  },
  methods: {
    generateBlankPagingObject() {
      return {
        page: 1,
        perPage: 12,
        totalCount: null,
        previous: null,
        next: null,
        setPage(pageNum) {
          this.page = pageNum;
        },
        setPrevious(previous) {
          this.previous = previous;
        },
        setNext(next) {
          this.next = next;
        },
        setTotalCount(totalCount) {
          this.totalCount = totalCount;
        },
        update(meta) {
          this.setPage(meta.current_page);
          this.setPrevious(meta.previous);
          this.setNext(meta.next);
          this.setTotalCount(meta.total_count);
        },
      };
    },
  },
};
