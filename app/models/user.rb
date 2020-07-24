class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :projects, through: :tasks

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true
    validates :password, length: { in: 6..20 }
    has_secure_password

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash['info']['email']).first_or_create do |user|
            user.password = SecureRandom.hex
            user.username = auth_hash['info']['name']
        end 
    end
end
