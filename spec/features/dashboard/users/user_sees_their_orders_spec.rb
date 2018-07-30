require 'rails_helper'

describe "A user" do
  before(:each) do
    @user = create(:user)
    @item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_3 = Item.create(title: "Roldfish", description: 'Whoopity loop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
  end
  context "logs in" do
    it 'sees all orders' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/bike-shop'

      within "#item-#{@item_1.id}" do
        click_on 'Add to Cart'
      end
      within "#item-#{@item_2.id}" do
        click_on 'Add to Cart'
      end
      within "#item-#{@item_3.id}" do
        click_on 'Add to Cart'
      end

      visit cart_path

      click_on 'Checkout'
      expected_number = @user.orders.first.id

      expect(page).to have_link("Order Number #{expected_number}")
    end
    it 'can click on an order and view order information' do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/bike-shop'

      within "#item-#{@item_1.id}" do
        click_on 'Add to Cart'
      end
      within "#item-#{@item_2.id}" do
        click_on 'Add to Cart'
      end
      within "#item-#{@item_3.id}" do
        click_on 'Add to Cart'
      end

      visit cart_path

      click_on 'Checkout'
      order_1 = @user.orders.first
      
      click_on "Order Number #{order_1.id}"

      expect(current_path).to eq(order_path(order_1))
      expect(page).to have_content("Total Amount: #{order_1.total}")
      expect(page).to have_content("Status: #{order_1.status}")
    end
    it 'can only see its own orders' do
      user_2 = create(:user)

      order_1 = @user.orders.create

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit order_path(order_1)

      expect(page).to have_content("404")
    end
  end
end
