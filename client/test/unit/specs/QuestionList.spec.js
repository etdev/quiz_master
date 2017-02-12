import QuestionList from 'components/QuestionList';

describe('QuestionList.vue', () => {
  it('has a created hook', () => {
    expect(typeof QuestionList.created).to.equal('function');
  });
  it('includes a QuestionItem component', () => {
    expect(QuestionList.components).to.include.keys('QuestionItem');
  });
  it('has a getQuestions function', () => {
    expect(QuestionList.methods).to.include.keys('getQuestions');
  });
});
