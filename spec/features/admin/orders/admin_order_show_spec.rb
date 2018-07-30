require 'rails_helper'

describe 'an admin' do
  context 'visiting orders/id' do
    it "sees the same information the Order's user would see" do
      admin = create(:user, role: 1)
      user = create(:user)
      item = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      order = user.orders.create
      OrderItem.create(order: order, item: item, quantity: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit order_path(order)
  
      expect(current_path).to eq(order_path(order))
      expect(page).to have_content("Total Amount: $400.00")
      expect(page).to have_content("Status: #{order.status}")
      expect(page).to have_content("#{order.created_at}")
      expect(page).to have_link("#{item.title}")
      expect(page).to have_content("#{order.order_items[0].quantity}")
      expect(page).to have_content("$400.00")
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.street_address)
      expect(page).to have_content(user.state)
      expect(page).to have_content(user.zip)
    end
  end
end