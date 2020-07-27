class ChangeTasksToLists < ActiveRecord::Migration[6.0]
  def change
    rename_table :tasks, :lists
  end
end
