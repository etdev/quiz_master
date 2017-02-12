class AddDescriptionToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :description, :string, null: false
  end
end
