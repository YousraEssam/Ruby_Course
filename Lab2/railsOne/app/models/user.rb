class User < ApplicationRecord
  
  validates :username, presence: true
  has_secure_password
  validates :email, presence: true, uniqueness: true

end
