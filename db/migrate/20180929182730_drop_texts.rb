class DropTexts < ActiveRecord::Migration[5.2]
  def change
    drop_table :texts
  end
end
