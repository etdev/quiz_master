require "rails_helper"

RSpec.describe "Questions API" do
  describe "GET #show" do
    context "with blank guess" do
      it "returns incorrect" do
        question = create(:question, content: "1 + 1?", answer: 2)

        get v1_guess_check_path(question, guess: "")

        expect(json_data(response)["result"]).to eq("incorrect")
      end
    end

    context "with incorrect numerical guess" do
      it "returns incorrect" do
        question = create(:question, content: "1 + 1?", answer: 2)

        get v1_guess_check_path(question, guess: 3)

        expect(json_data(response)["result"]).to eq("incorrect")
      end
    end

    context "with correct numerical guess" do
      it "returns correct" do
        question = create(:question, content: "1 + 1?", answer: 2)

        get v1_guess_check_path(question, guess: 2)

        expect(json_data(response)["result"]).to eq("correct")
      end
    end
  end
end
