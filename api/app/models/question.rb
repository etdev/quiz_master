class Question < ApplicationRecord
  validates :content, presence: true
  validates :answer, presence: true

  def correct_answer?(guess)
    answer == guess
  end
end
