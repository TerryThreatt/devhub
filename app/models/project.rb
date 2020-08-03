class Project < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :project_tasks, dependent: :destroy
  has_many :users, through: :project_tasks
  has_many :tasks, through: :project_tasks
  # Validations
  validates :name, :due_date, presence: true

  

  # Attributes
#   accepts_nested_attributes_for :user, reject_if: proc { |attributes|
#     attributes[:email].blank? }

#   def users_attributes=(attributes)
#     attributes.values.each do |v|
#         self.users << User.find_or_create_by(v) if !v[:email].empty?
#     end
#   end

#   def tasks_attributes=(attributes)
#     attributes.values.each do |v|
#       self.tasks << Task.find_or_create_by(v) if !v[:name].empty?
#   end

#   def project_tasks_attributes=(attributes)
#   end
# end

end
