require "rails_helper"

RSpec.describe "Questions API" do
  context "GET questions" do
    it "returns success" do
      FactoryGirl.create_list(:question, 2)

      get v1_questions_path

      expect(response).to be_success
    end
  end
end
