class ProjectTask < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :task
  belongs_to :project
  # Validations
  validates :name, :due_date, presence: true

  # Scope
  scope :done, -> {
    where(:done? => true)
  }

  def project_attributes=(project_params)
    project_params.values.each do |project_attrs|
      unless project_attrs.values.any?(&:empty?)
        self.projects << Project.new(project_attrs)
      end
    end
  end

  def user_attributes=(user_params)
    user_params.values.each do |user_attrs|
      unless room_attrs.values.any?(&:empty?)
        self.users << User.new(user_attrs)
      end
    end
  end

  def task_attributes=(task_params)
    task_params.values.each do |task_attrs|
      unless task_attrs.values.any?(&:empty?)

        self.tasks << Task.new(task_attrs)
      end
    end
  end
end 
