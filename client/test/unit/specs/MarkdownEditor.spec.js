import Vue from 'vue';
import MarkdownEditor from 'src/components/MarkdownEditor';

describe('MarkdownEditor', () => {
  it('sets the correct default data', () => {
    expect(typeof MarkdownEditor.data).to.equal('function');
    const defaultData = MarkdownEditor.data();
    expect(defaultData.inputMarkdown).to.equal('# hello');
  });

  it('correctly sets the compiled HTML on creation', () => {
    const vm = new Vue(MarkdownEditor).$mount();
    expect(vm.compiledMarkdown).to.equal(
      '<h1 id="hello">hello</h1>\n',
    );
  });

  it('correctly updates compiled HTML on input change', () => {
    const vm = new Vue(MarkdownEditor).$mount();
    vm.inputMarkdown = "### bello";
    expect(vm.compiledMarkdown).to.equal(
      '<h3 id="bello">bello</h3>\n',
    );
  });
});
