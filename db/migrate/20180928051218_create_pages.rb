class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.integer :priority
      t.timestamps
    end
  end
end
