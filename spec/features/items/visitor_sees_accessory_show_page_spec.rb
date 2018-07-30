require 'rails_helper'

describe 'A visitor' do
  describe 'visiting accessory show page' do
    before :each do
      @item = Item.create(title: 'bike lights', description: 'wonderful led', price: 10, image: 'https://www.elegantthemes.com/blog/wp-content/uploads/2015/02/custom-trackable-short-url-feature.png')
    end
    it 'sees all attributes of this accessory and can click to add it to cart' do

      visit item_path(@item)

      expect(page).to have_content(@item.title)
      expect(page).to have_content(@item.description)
      expect(page).to have_content(@item.price)
      expect(page).to have_button('Add to Cart')
    end
    it 'denies user trying to put retired item in cart' do
      user = create(:user)
      new_item = Item.create!(title: 'bike lizzights', description: 'wonderful led', price: 10, image: 'https://www.elegantthemes.com/blog/wp-content/uploads/2015/02/custom-trackable-short-url-feature.png', status: 'retired')

      visit item_path(new_item)

      expect(page).to have_content('Accessory Retired')
    end
  end
end
