require "rails_helper"

RSpec.describe Question do
  it "has a valid factory" do
    expect(build(:question)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:question, name: nil)).to be_invalid
  end

  it "is invalid with a blank name" do
    expect(build(:question, name: "")).to be_invalid
  end

  it "is invalid without any content" do
    expect(build(:question, content: nil)).to be_invalid
  end

  it "is invalid with blank content" do
    expect(build(:question, content: "")).to be_invalid
  end

  it "is invalid without an answer" do
    expect(build(:question, answer: nil)).to be_invalid
  end

  it "is invalid without an answer" do
    expect(build(:question, answer: "")).to be_invalid
  end

  it "is invalid without a category" do
    expect(build(:question, category: nil)).to be_invalid
  end

  it "accepts both numeric and spelled-out numbers" do
    # TODO
  end
end
