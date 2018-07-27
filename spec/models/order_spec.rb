require 'rails_helper'

describe Order, type: :model do
  context 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:status)}
  end
  context 'relationships' do
    it {should have_many(:order_items)}
    it {should belong_to(:user)}
  end
  context 'class methods' do
    it '#generate_order_items' do
      user = create(:user)
      item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      order = user.orders.create

      cart = {item_1.id.to_s => 1, item_2.id.to_s => 2}
      order.generate_order_items(cart)


      expect(order.order_items[0].item_id).to eq(item_1.id)
      expect(order.order_items[1].item_id).to eq(item_2.id)

      expect(order.order_items[0].quantity).to eq(1)
      expect(order.order_items[1].quantity).to eq(2)
      
      expect(user.orders.size).to eq(1)
    end
  end
end