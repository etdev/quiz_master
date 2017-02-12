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

  it "is invalid without a description" do
    expect(build(:question, content: nil)).to be_invalid
  end

  it "is invalid with a blank description" do
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

  it "ignores capitalization" do
    category = build(:question, answer: "George Washington")
    expect(category.correct_answer?("george washington")).to be(true)
  end

  it "treats spaces and hyphens the same when between words" do
    category = build(:question, answer: "a-b-c")
    expect(category.correct_answer?("a b c")).to be(true)
  end

  it "disregards spaces at beginning and end" do
    category = build(:question, answer: "  a   ")
    expect(category.correct_answer?("a")).to be(true)
  end

  it "disregards multiple spaces" do
    category = build(:question, answer: "a b c")
    expect(category.correct_answer?("a             b          c")).to be(true)
  end

  it "converts numbers to words" do
    category = build(:question, answer: "5")
    expect(category.correct_answer?("five")).to be(true)
    expect(category.correct_answer?("5")).to be(true)
  end
end
