class DropMusics < ActiveRecord::Migration[5.2]
  def change
    drop_table :musics
  end
end
