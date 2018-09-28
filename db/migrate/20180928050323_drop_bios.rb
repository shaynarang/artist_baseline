class DropBios < ActiveRecord::Migration[5.2]
  def change
    drop_table :bios
  end
end
