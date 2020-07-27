class Task < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :team
  belongs_to :project
  # Validations
  validates :name, :due_date, presence: true
  # Nested Attributes
  accepts_nested_attributes_for :team, :user, :project
end
