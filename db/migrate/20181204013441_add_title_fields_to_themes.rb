class AddTitleFieldsToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :title_font_url, :string
    add_column :themes, :title_font_family, :string
    add_column :themes, :title_font_color, :string
  end
end
