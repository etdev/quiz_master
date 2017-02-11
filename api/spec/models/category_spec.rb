require "rails_helper"

RSpec.describe Category do
  it "has a valid factory" do
    expect(build(:category)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:question, name: nil)).to be_invalid
  end

  it "is invalid with a blank name" do
    expect(build(:question, name: "")).to be_invalid
  end
end
