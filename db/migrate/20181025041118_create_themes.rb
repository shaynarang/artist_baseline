class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.references :site, foreign_key: true, index: true
    end
  end
end
