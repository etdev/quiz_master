export default {
  created() { },
  data() {
    return { };
  },
  methods: {
    generateBlankFlash() {
      return {
        message: 'Test',
        type: null,
        visible: false,
        timeouts: [],
        show(message, type = 'success', length = 5000) {
          this.message = message;
          this.type = type;
          this.visible = true;
          this.timeouts.push(setTimeout(() => {
            this.hide();
          }, length));
        },
        hide() {
          this.visible = false;
        },
        clear() {
          for (const func of this.timeouts) {
            clearTimeout(func);
          }
        },
      };
    },
  },
};
