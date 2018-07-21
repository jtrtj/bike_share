class User < ApplicationRecord
  validates_presence_of :user_name, :password
  validates_uniqueness_of :user_name

  has_secure_password

  enum role: %w(default admin)
end
