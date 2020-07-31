class ProjectTask < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :task
  belongs_to :project
  # Validations
  validates :name, :due_date, presence: true
  validates_presence_of :user_id, :task_id, :project_id
  # Nested Attributes
  accepts_nested_attributes_for :task, :user
end
