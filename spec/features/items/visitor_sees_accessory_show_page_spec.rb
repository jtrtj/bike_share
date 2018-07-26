require 'rails_helper'

describe 'A visitor' do
  describe 'visiting accessory show page' do
    before :each do
      @item = Item.create(title: 'bike lights', description: 'wonderful led', price: 10, image: 'bike.com')
    end
    it 'sees all attributes of this accessory and can click to add it to cart' do

      visit item_path(@item)

      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
      expect(page).to have_content(item.image)
      expect(page).to have_link('Add to Cart')
    end
  end
end
