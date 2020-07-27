class Team < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :users, through: :projects
  # Validations
  validates :name, presence: true
  # Nested Attributes
  accepts_nested_attributes_for :users, allow_destroy: true

end
