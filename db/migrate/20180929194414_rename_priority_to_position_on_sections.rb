class RenamePriorityToPositionOnSections < ActiveRecord::Migration[5.2]
  def change
    rename_column :sections, :priority, :position
  end
end
