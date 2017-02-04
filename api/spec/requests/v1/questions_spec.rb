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
end
