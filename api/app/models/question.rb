class Question < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :description, presence: true
  validates :answer, presence: true
  validates :category, presence: true

  paginates_per 12

  default_scope -> { order(updated_at: :desc) }

  def correct_answer?(guess)
    sanitize(answer)
      .casecmp(sanitize(guess))
      .zero?
  end

  def self.by_category(category_id)
    return self if category_id.blank?

    where(category_id: category_id)
  end

  private

  def sanitize(str)
    stripped = str
      .strip
      .tr("-", " ")
      .squeeze(" ")

    replace_numerals_with_words(stripped)
  end

  def replace_numerals_with_words(str)
    str.gsub(/\d+/) { |num| num.to_i.to_words.tr("-", " ") }
  end
end
