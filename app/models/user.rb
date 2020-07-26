class User < ApplicationRecord
    # Associations
    has_many :teams
    has_many :projects, through: :teams
    # Validations
    validates :email, :password, presence: true
    # Devise
    devise  :invitable, :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable, :omniauthable
end
