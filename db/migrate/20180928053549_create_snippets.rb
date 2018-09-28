class CreateSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :snippets do |t|
      t.text :content
      t.integer :priority
      t.references :page, foreign_key: true, index: true
    end
  end
end
