class Item < ApplicationRecord
  validates_presence_of :title, :description, :image, :price, :status

  enum status: %w(retired active)
end
