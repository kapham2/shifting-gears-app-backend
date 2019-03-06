class User < ApplicationRecord
    has_secure_password
    has_many :games
    validates :username, :password, presence: true
    validates :username, uniqueness: { case_sensitive: false }
end
