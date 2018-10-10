class RenameImagesToPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_table :images, :photos
  end
end
