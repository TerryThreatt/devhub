class CreateProjectTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tasks do |t|
      t.string :priority, array: true 
      t.datetime :due_date
      t.boolean :done, default: false
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
