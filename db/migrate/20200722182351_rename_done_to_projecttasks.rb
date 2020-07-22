class RenameDoneToProjecttasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :project_tasks, :done, :done?
  end
end
