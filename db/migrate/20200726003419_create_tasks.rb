class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :priority, array: true, default: []
      t.date :due_date
      t.boolean :done?, default: false
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
