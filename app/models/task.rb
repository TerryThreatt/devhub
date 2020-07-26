class Task < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :team
  belongs_to :project
  # Validations
  validates :name, presence: true
  validates :priority, presence: true,
            :inclusion => { :in => %w(low medium high),
            :message => "%{priority} is not selected" }
  # Nested Attributes
  accept_nested_attributes_for :team, :user, :project 
end
