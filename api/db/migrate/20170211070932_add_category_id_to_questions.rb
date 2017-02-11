class AddCategoryIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :category, index: true
  end
end
