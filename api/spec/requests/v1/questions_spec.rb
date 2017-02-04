require "rails_helper"

RSpec.describe "Questions API" do
  context "GET questions" do
    it "is successful" do
      get v1_questions_path

      expect(response).to be_success
    end

    it "returns list of questions" do
      FactoryGirl.create_list(:question, 2)

      get v1_questions_path

      expect(json_data(response)["questions"].length).to eq(2)
    end
  end

  context "POST new question" do
    it "is successful" do
      question = build(:question)

      post v1_questions_path, question: question.attributes

      expect(response).to be_success
    end

    it "is increases number of questions by one" do
      question = build(:question)

      post v1_questions_path, question: question.attributes

      expect(Question.count).to eq(1)
    end
  end
end
