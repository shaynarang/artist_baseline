class AddColumnsToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :font, :string
    add_column :themes, :nav_background_color, :string
    add_column :themes, :nav_text_color, :string
    add_column :themes, :main_background_color, :string
    add_column :themes, :content_background_color, :string
    add_column :themes, :content_text_color, :string
    add_column :themes, :border_color, :string
    add_column :themes, :published, :boolean, default: false
  end
end
