class ProjectTask < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :task
  belongs_to :project
  # Validations
  validates :name, :due_date, presence: true
  # Attributes
  accepts_nested_attributes_for :task, :project
  # Scope
  scope :recent, -> { order(created_at: :desc) }
  scope :due_soon, -> { order(due_date: :asc) }
  scope :done, -> { where(done?: :true ) }


end
