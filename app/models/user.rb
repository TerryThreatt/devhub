class User < ApplicationRecord
    has_many :tasks
    has_many :projects, through: :tasks

    validates :username, :email, :password, presence: true 
end
