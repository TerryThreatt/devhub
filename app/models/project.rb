class Project < ApplicationRecord
  belongs_to :user
  has_many :project_tasks
  has_many :tasks, through: :project_tasks
  has_many :users, through: :project_tasks

  validates :name, :due_date, presence: true
end
