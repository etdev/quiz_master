class RemoveExactOnlyFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :exact_only
  end
end
