class ChangeListsToProjectTasks < ActiveRecord::Migration[6.0]
  def change
    rename_table :lists, :project_tasks
    rename_column :project_tasks, :team_id, :task_id
  end
end
