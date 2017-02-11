class Question < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :content, presence: true
  validates :answer, presence: true
  validates :category, presence: true

  def correct_answer?(guess)
    answer == guess
  end
end
