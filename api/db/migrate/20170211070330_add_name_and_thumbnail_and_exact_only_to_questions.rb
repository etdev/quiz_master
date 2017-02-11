class AddNameAndThumbnailAndExactOnlyToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :name, :string, null: false
    add_column :questions, :thumbnail_url, :string
    add_column :questions, :exact_only, :boolean, null: false, default: false
  end
end
