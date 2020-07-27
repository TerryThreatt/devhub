class Project < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :team
  has_many :tasks, dependent: :destroy
  has_many :users, through: :tasks
  # Validations
  validates :name, :due_date, presence: true
  # Nested Attributes
  accepts_nested_attributes_for :team, :user

end
