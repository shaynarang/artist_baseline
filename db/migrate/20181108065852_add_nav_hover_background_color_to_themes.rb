class AddNavHoverBackgroundColorToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :nav_hover_background_color, :string
  end
end
