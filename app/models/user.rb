class User < ApplicationRecord
  # Associations
  has_many :projects
  has_many :project_tasks
  has_many :tasks, through: :project_tasks

  # Validations
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

    def self.create_from_provider_data(provider_data)
        where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
            user.provider = provider_data.provider
            user.uid = provider_data.uid
            user.email = (provider_data.info.email.nil?) ? "#{provider_data.uid}@email.com" : provider_data.info.email
            user.password = Devise.friendly_token[0, 20]
        end
    end
end
