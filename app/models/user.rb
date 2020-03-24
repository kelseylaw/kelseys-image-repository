class User < ApplicationRecord
    has_many :images
    validates :username, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
    has_secure_password
end
