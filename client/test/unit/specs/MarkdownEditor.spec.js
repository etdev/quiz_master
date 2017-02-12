import MarkdownEditor from 'src/components/MarkdownEditor';

describe('MarkdownEditor.vue', () => {
  it('sets the correct default data', () => {
    expect(typeof MarkdownEditor.data).to.equal('function');
  });
});
