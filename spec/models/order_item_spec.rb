require 'rails_helper'

describe OrderItem, type: :model do
  context 'validations' do
    it {should validate_presence_of(:order_id)}
    it {should validate_presence_of(:item_id)}
    it {should validate_presence_of(:quantity)}
  end
  context 'relationships' do
    it {should belong_to(:item)}
    it {should belong_to(:order)}
  end
  context 'instance methods' do
    it '#total_price' do
      user = create(:user)
      item = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      quantity = 3
      order = user.orders.create
      order_item = order.order_items.create(item: item, quantity: quantity)

      expect(order_item.total_price).to eq(item.price * quantity)
    end
  end
end