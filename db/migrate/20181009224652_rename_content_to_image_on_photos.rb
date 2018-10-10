class RenameContentToImageOnPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :content, :image
  end
end
