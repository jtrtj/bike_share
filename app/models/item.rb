class Item < ApplicationRecord
  validates_presence_of :description, :image, :price, :status
  validates :title, uniqueness: true, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  enum status: %w(retired active)
end
