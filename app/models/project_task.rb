class ProjectTask < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :task
  belongs_to :project
  # Validations
  validates :name, :due_date, presence: true
  # Nested Attributes
  accepts_nested_attributes_for :task, :user, :project
end
