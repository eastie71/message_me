class User < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 253 }, format: { with: VALID_EMAIL_REGEX }
	validates :username, presence: true, length: { minimum: 3, maximum: 50 }
	has_many :messages
	has_secure_password
end
