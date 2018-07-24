require "rails_helper"

describe 'a visitor' do
  describe 'visiting the bike shop index' do
    it 'sees a list of all accessories' do
      item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, active: true)
      item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, active: true)
      item_3 = Item.create(title: "Roldfish", description: 'Whoopity loop', image: 'http://via.placeholder.com/100x100', price: 400, active: true)

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
    end
  end
end
