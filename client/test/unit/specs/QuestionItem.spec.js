import QuestionItem from 'components/QuestionItem';

describe('QuestionItem.vue', () => {
  it('has an answerQuestionPath method', () => {
    expect(typeof QuestionItem.methods.answerQuestionPath).to.equal('function');
  });
  it('has a backgroundImageStyle method', () => {
    expect(typeof QuestionItem.methods.backgroundImageStyle).to.equal('function');
  });
  it('has a deleteQuestion method', () => {
    expect(typeof QuestionItem.methods.deleteQuestion).to.equal('function');
  });
});
