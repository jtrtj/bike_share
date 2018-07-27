require 'rails_helper'

describe 'a registered user' do
  before :each do
    @user = create(:user)
    @item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    @item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
    
  end
  context 'can place an order' do
    it 'puts items in cart, views cart, clicks checkout and sees the new order on the dashboard' do
      expected = "$#{@item_1.price + @item_2.price}"
      visit '/bike-shop'

      within "#item-#{@item_1.id}" do
        click_on 'Add to Cart'
      end
      within "#item-#{@item_2.id}" do
        click_on 'Add to Cart'
      end
      
      visit cart_path

      click_on 'Checkout'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Successfully submited your order totalling #{expected}}")
    end
  end
end