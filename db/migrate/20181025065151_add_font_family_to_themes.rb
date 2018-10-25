class AddFontFamilyToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :font_family, :string
  end
end
