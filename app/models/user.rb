class User < ApplicationRecord
    # Associations
    has_many :projects
    has_many :project_tasks
    has_many :tasks, through: :project_tasks
    # Validations
    validates :email, :password, presence: true
    validates :email, uniqueness: true
    # Devise
    devise  :invitable, :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]

end
