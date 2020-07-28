class ChangeTeamsToTasks < ActiveRecord::Migration[6.0]
  def change
    rename_table :teams, :tasks
    remove_column :tasks, :user_id
  end
end
