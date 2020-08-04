class Task < ApplicationRecord
  # Associations
  has_many :projects_tasks, dependent: :destroy
  has_many :projects, through: :projects_tasks
  # has_many :users, through: :projects_tasks
  # Validations
  validates :name, presence: true

end
