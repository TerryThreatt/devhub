class ProjectTask < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :task

  validates :due_date, presence: true
  validates :priority, presence: true,
            :inclusion => { :in => %w(low medium high),
            :message => "%{priority} is not selected" }
end
