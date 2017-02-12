import Home from 'components/Home';

describe('Home.vue', () => {
  it('has a mainBannerImage', () => {
    expect(typeof Home.methods.mainBannerImage).to.equal('function');
    expect(typeof Home.methods.mainBannerImage()).to.equal('string');
  });
  it('has a scrollToQuestions function', () => {
    expect(typeof Home.methods.mainBannerImage).to.equal('function');
  });
  it('includes QuestionList component', () => {
    expect(Home.components).to.include.keys('QuestionList');
  });
  it('includes Pagination component', () => {
    expect(Home.components).to.include.keys('QuestionList');
  });
});
