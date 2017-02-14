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

      it "includes question description" do
        question = create(:question)

        get v1_question_path(question)

        expect(json_data(response)["question"].keys).to include("description")
      end

      it "includes associated category, with name" do
        question = create(:question)

        get v1_question_path(question)

        expect(json_data(response).dig("question", "category"))
          .to be_present
        expect(json_data(response).dig("question", "category").keys)
          .to include("name")
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

        post v1_questions_path, params: { question: question.attributes }

        expect(response).to be_success
      end

      it "returns created question" do
        question = build(:question)

        post v1_questions_path, params: { question: question.attributes }

        expect(json_data(response)["question"]).to be_present
      end

      it "increases number of questions by one" do
        question = build(:question)

        post v1_questions_path, params: { question: question.attributes }

        expect(Question.count).to eq(1)
      end
    end

    context "with blank attribute" do
      it "returns unprocessable_entity status when content is empty" do
        question = build(:question, content: "")

        post v1_questions_path, params: { question: question.attributes }

        expect(response).to have_http_status(:bad_request)
      end

      it "returns bad_request status when answer is empty" do
        question = build(:question, answer: "")

        post v1_questions_path, params: { question: question.attributes }

        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "PUT #update" do
    context "with valid question data" do
      it "returns success status" do
        question = create(:question)

        put v1_question_path(question), params: { question: question.attributes }

        expect(response).to be_success
      end

      it "returns updated question" do
        question = create(:question)

        put v1_question_path(question), params: { question: question.attributes }

        expect(json_data(response)["question"]).to be_present
      end

      it "doesn't increase number of questions" do
        question = create(:question)

        put v1_question_path(question), params: { question: question.attributes }

        expect(Question.count).to eq(1)
      end

      it "successfully changes name" do
        question = create(:question, name: "Old name")

        edited_question = question
        edited_question.name = "New name"

        put v1_question_path(question), params: { question: edited_question.attributes }

        expect(json_data(response)["question"]).to be_present
        expect(json_data(response)["question"]["name"]).to eq("New name")
      end

      it "successfully changes description" do
        question = create(:question, description: "Old description")

        edited_question = question
        edited_question.description = "New description"

        put v1_question_path(question), params: { question: edited_question.attributes }

        expect(json_data(response)["question"]).to be_present
        expect(json_data(response)["question"]["description"])
          .to eq("New description")
      end

      it "successfully changes content" do
        question = create(:question, content: "# Old content")

        edited_question = question
        edited_question.content = "# New content"

        put v1_question_path(question), params: { question: edited_question.attributes }

        expect(json_data(response)["question"]).to be_present
        expect(json_data(response)["question"]["content"])
          .to eq("# New content")
      end

      it "successfully changes answer" do
        question = create(:question, answer: "Old answer")

        edited_question = question
        edited_question.answer = "New answer"

        put v1_question_path(question), params: { question: edited_question.attributes }

        expect(json_data(response)["question"]).to be_present
        expect(json_data(response)["question"]["answer"])
          .to eq("New answer")
      end
    end
  end

  describe "DELETE #destroy" do
    context "with valid id" do
      it "returns success status" do
        question = create(:question)

        delete v1_question_path(question)

        expect(response).to be_success
      end

      it "successfully delets specified question" do
        question = create(:question)

        delete v1_question_path(question)

        expect(response).to be_success
        expect(json_data(response)["result"]).to eq("success")
        expect(Question.count).to eq(0)
      end
    end
  end
end
