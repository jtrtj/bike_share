class Item < ApplicationRecord
  validates_presence_of :title, :description, :image, :price, :status
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  enum status: %w(retired active)
end
