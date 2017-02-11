require "rails_helper"

RSpec.describe "Categories API" do
  describe "GET #index" do
    it "returns success status" do
      get v1_categories_path

      expect(response).to be_success
    end

    it "returns list of categories" do
      FactoryGirl.create_list(:category, 2)

      get v1_categories_path

      expect(json_data(response)["categories"].length).to eq(2)
    end
  end
end
