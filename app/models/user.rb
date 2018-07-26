class User < ApplicationRecord
validates_presence_of :password,
                      :first_name,
                      :last_name,
                      :street_address,
                      :city,
                      :state,
                      :zip
  validates :user_name, uniqueness: true, presence: true

  has_secure_password

  enum role: %w(default admin)

end
