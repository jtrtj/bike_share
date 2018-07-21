class User < ApplicationRecord
  validates_presence_of :user_name, :password
  validates :user_name, uniqueness: true, presence: true

  has_secure_password

  enum role: %w(default admin)

end
