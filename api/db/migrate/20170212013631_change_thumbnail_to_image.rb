class ChangeThumbnailToImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :thumbnail_url, :image_url
    remove_column :questions, :thumbnail_url
  end
end
