class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :projects, through: :tasks

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true
    validates :password, length: { in: 6..20 }
    has_secure_password 
end
