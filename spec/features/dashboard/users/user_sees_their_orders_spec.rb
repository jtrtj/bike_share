require 'rails_helper'

describe "A user" do
  before(:each) do
    @user = create(:user)
    @item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_3 = Item.create(title: "Roldfish", description: 'Whoopity loop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)

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

  end
  context "logs in" do
    it 'sees all orders' do
      expected_number = @user.orders.first.id

      expect(page).to have_link("Order Number #{expected_number}")
    end
    it 'can click on an order and view order information' do
      order_1 = @user.orders.first

      click_on order_1.id

      expect(current_path).to eq(order_path(order_1))
      expect(page).to have_content(expected_number)
    end
  end
end
