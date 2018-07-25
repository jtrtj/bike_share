require "rails_helper"

describe 'a visitor' do
  describe 'visiting the bike shop index' do
    it 'sees a list of all accessories' do
      item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      item_3 = Item.create(title: "Roldfish", description: 'Whoopity loop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)

      visit "/bike-shop"

      within "#item-#{item_1.id}" do
        click_button('Add to Cart')
      end
      within "#item-#{item_1.id}" do
        click_button('Add to Cart')
      end
      within "#item-#{item_2.id}" do
        click_button('Add to Cart')
      end
      within "#item-#{item_2.id}" do
        click_button('Add to Cart')
      end
      within "#item-#{item_2.id}" do
        click_button('Add to Cart')
      end
      within "#item-#{item_3.id}" do
        click_button('Add to Cart')
      end

      click_on "Cart: "

      save_and_open_page

      expect(page).to have_content('Quantity')
      expect(page).to have_content('Subtotal')
    end
  end
end
