class AddNoTitleToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :no_title, :boolean
  end
end
