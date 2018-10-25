class RenameFontToFontUrlOnThemes < ActiveRecord::Migration[5.2]
  def change
    rename_column :themes, :font, :font_url
  end
end
