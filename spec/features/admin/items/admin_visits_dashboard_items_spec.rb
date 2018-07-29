require 'rails_helper'

describe 'An admin' do
  describe 'visiting the dashboard can go to all items for admin' do
    before :each do
      @admin = create(:user, role: 1)
      @item = Item.create(title: 'bike lights', description: 'wonderful led', price: 10, image: 'https://www.elegantthemes.com/blog/wp-content/uploads/2015/02/custom-trackable-short-url-feature.png', status: 1)
      @item2 = Item.create(title: 'wheels', description: 'circle', price: 90, image: 'https://www.elegantthemes.com/blog/wp-content/uploads/2015/02/custom-trackable-short-url-feature.png', status: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it 'sees link to view all items and click on it current path should be "/admin/bike-shop"' do

      visit admin_dashboard_index_path

      expect(page).to have_link('All Items')
      click_link 'All Items'
      expect(current_path).to eq(admin_bike_shop_path)
    end
    it 'can see all accessories in a table on admin/bike-shop with a thumbnail of the image, description, status' do
      visit admin_bike_shop_path

      expect(page).to have_content(@item.description)
      expect(page).to have_content(@item.title)
      expect(page).to have_content(@item.price)
      expect(page).to have_content(@item.status)

      expect(page).to have_content(@item2.description)
      expect(page).to have_content(@item2.title)
      expect(page).to have_content(@item2.price)
      expect(page).to have_content(@item2.status)
    end
  end
end
