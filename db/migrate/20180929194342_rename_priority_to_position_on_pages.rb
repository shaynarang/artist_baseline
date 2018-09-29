class RenamePriorityToPositionOnPages < ActiveRecord::Migration[5.2]
  def change
    rename_column :pages, :priority, :position
  end
end
