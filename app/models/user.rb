class User < ApplicationRecord
    # Associations
    has_many :teams, dependent: :destroy
    has_many :projects, through: :teams
    # Validations
    
    # Devise
    devise  :invitable, :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable, :omniauthable
end
