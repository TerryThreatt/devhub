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
  scope :asc, -> { order(create_at: :asc ) }
  scope :desc, -> { order(create_at: :desc ) }

  # def self.done_count
  #     self.where(done?: 'true').count
  # end

  # def self.done_group
  #     self.group(done?: 'true')
  # end

  # def project_attributes=(project_params)
  #   attributes.values.each do |v|
  #     unless attributes.values.any?(&:empty?)
  #       self.project << Project.find_or_create_by(v)
  #     end
  #   end
  # end

  # def user_attributes=(attributes)
  #   attributes.values.each do |v|
  #     unless attributes.values.any?(&:empty?)
  #       self.user << User.find_or_create_by(v)
  #     end
  #   end
  # end


  # def task_attributes=(attributes)
  #   attributes.values.each do |v|
  #     unless attributes.values.any?(&:empty?)
  #       self.task << Task.find_or_create_by(v)
  #     end
  #   end
  # end

end
