require 'rails_helper'

describe 'a registered user' do
  before :each do
    @user = create(:user)
    @item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    
  end
  context 'can place an order' do
    it 'puts items in cart, views cart, clicks checkout and sees the new order on the dashboard' do
      
      visit '/bike-shop'

      within "#item-#{@item_1.id}" do
        click_on 'Add to Cart'
      end
      within "#item-#{@item_2.id}" do
        click_on 'Add to Cart'
      end
      
    end
  end
end