require "rails_helper"

describe 'a visitor' do
  describe 'visiting the bike shop index' do
    it 'sees a list of all accessories' do
      item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      item_3 = Item.create(title: "Roldfish", description: 'Whoopity loop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)

      visit "/bike-shop"

      within "#item-#{item_1.id}" do
        expect(page).to have_button('Add to Cart')
      end
      within "#item-#{item_2.id}" do
        expect(page).to have_button('Add to Cart')
      end
      within "#item-#{item_3.id}" do
        expect(page).to have_button('Add to Cart')
      end


      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_3.title)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_2.description)
      expect(page).to have_content(item_3.description)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_2.price)
      expect(page).to have_content(item_3.price)
    end
    it 'can add an item to its cart' do
      item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)

      visit "/bike-shop"

      expect(page).to have_content('Cart: 0')

      within "#item-#{item_1.id}" do
        click_button('Add to Cart')
      end

      expect(page).to have_content("You now have 1 #{item_1.title} in your cart!")
      expect(page).to have_content('Cart: 1')

      within "#item-#{item_1.id}" do
        click_button('Add to Cart')
      end

      expect(page).to have_content("You now have 2 #{item_1.title}es in your cart!")
      expect(page).to have_content("Cart: 2")
    end
  end
end
