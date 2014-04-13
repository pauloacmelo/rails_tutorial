class User < ActiveRecord::Base
  has_secure_password

  has_many :microposts

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :name,  presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }
end
