class Project < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :project_tasks, dependent: :destroy
  has_many :users, through: :project_tasks
  has_many :tasks. through: :project_tasks
  # Validations
  validates :name, :due_date, presence: true

end
