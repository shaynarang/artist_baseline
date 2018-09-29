class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :kind
      t.text :content
      t.integer :priority
      t.references :page, foreign_key: true, index: true
    end
  end
end
