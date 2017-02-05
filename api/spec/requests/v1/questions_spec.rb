require "rails_helper"

RSpec.describe "Questions API" do
  describe "GET #show" do
    context "with valid question" do
      it "returns 200" do
        question = create(:question)

        get v1_question_path(question)

        expect(response).to be_success
      end

      it "returns question data" do
        question = create(:question)

        get v1_question_path(question)

        expect(json_data(response).length).to eq(1)
      end

      it "includes question content" do
        question = create(:question)

        get v1_question_path(question)

        expect(json_data(response)["question"].keys).to include("content")
      end

      it "doesn't include question answer" do
        question = create(:question)

        get v1_question_path(question)

        expect(json_data(response)["question"].keys).not_to include("answer")
      end
    end

    context "with nonexistent question" do
      it "returns not_found status" do
        question = build(:question, id: 1)

        get v1_question_path(question)

        expect(response).to be_not_found
      end
    end
  end

  describe "GET #index" do
    it "returns success status" do
      get v1_questions_path

      expect(response).to be_success
    end

    it "returns list of questions" do
      FactoryGirl.create_list(:question, 2)

      get v1_questions_path

      expect(json_data(response)["questions"].length).to eq(2)
    end
  end

  describe "POST #create" do
    context "with valid question data" do
      it "returns success status" do
        question = build(:question)

        post v1_questions_path, question: question.attributes

        expect(response).to be_success
      end

      it "returns created question" do
        question = build(:question)

        post v1_questions_path, question: question.attributes

        expect(json_data(response)["question"]).to be_present
      end

      it "increases number of questions by one" do
        question = build(:question)

        post v1_questions_path, question: question.attributes

        expect(Question.count).to eq(1)
      end
    end

    context "with blank attribute" do
      it "returns unprocessable_entity status when content is empty" do
        question = build(:question, content: "")

        post v1_questions_path, question: question.attributes

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns unprocessable_entity status when answer is empty" do
        question = build(:question, answer: "")

        post v1_questions_path, question: question.attributes

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
