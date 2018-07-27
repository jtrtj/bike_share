class Order < ApplicationRecord
  validates_presence_of :user_id, :status
  belongs_to :user
  has_many :order_items

  def generate_order_items(cart)
    cart.each do |item_id, quantity|
      order_items.create(item_id: item_id, quantity: quantity)
    end
  end
end