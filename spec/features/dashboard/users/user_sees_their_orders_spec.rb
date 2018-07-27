require 'rails_helper'

describe "A user" do
  before(:each) do
    @user = create(:user)
    @item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_3 = Item.create(title: "Roldfish", description: 'Whoopity loop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  context "logs in" do
    it 'sees all orders' do
      visit '/bike-shop'

      within "#item-#{@item_1.id}" do
        click_on 'Add to Cart'
      end
      within "#item-#{@item_2.id}" do
        click_on 'Add to Cart'
      end

      visit cart_path

      click_on 'Checkout'

    end
  end
end
