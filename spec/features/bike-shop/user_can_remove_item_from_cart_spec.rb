require "rails_helper"

describe 'a visitor' do
  describe 'visiting the bike shop cart' do
    it 'can edit what and how much is in the cart' do
      item_1 = Item.create(title: "Goldfish", description: 'Whoopity scoop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)
      item_2 = Item.create(title: "Boldfish", description: 'Whoopity doop', image: 'http://via.placeholder.com/100x100', price: 400, status: 1)

      visit "/bike-shop"

      within "#item-#{item_1.id}" do
        click_button('Add to Cart')
      end
      within "#item-#{item_2.id}" do
        click_button('Add to Cart')
      end

      click_on "Cart: "

      within "#item-#{item_1.id}" do
        click_button('Remove')
      end

      within ".cart" do
        expect(page).to_not have_content(item_1.title)
        expect(page).to have_content(item_2.title)
      end

      within ".flash" do
        expect(page).to have_link(item_1.title)
        expect(page).to have_content("You removed #{item_1.title} from your cart.")
      end

      within "#item-#{item_2.id}" do
        click_button('+')
      end

      within "#item-#{item_2.id}" do
        expect(page).to have_content(2)
      end

      within "#item-#{item_2.id}" do
        click_button('-')
      end

      within "#item-#{item_2.id}" do
        expect(page).to have_content(1)
      end
    end
  end
end