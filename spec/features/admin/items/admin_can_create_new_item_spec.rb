require 'rails_helper'

describe 'An admin' do
  describe 'visiting bike shop new' do
    before :each do
      @admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it 'can create a new item' do

      visit admin_bike_shop_new_path

      fill_in :item_price, with: 200
      fill_in :item_description, with: 'brand new'
      fill_in :item_title, with: 'wheels'
      select 'retired', from: :item_status

      click_button 'Create Item'

      expect(current_path).to eq(admin_bike_shop_path)
      expect(page).to have_content('wheel')
      expect(page).to have_content("brand new")
      expect(page).to have_content(200)
      expect(page).to have_content('retired')
    end
    it 'must have a description and title and price must be a valid decimal numeric value and greater than zero' do

      visit admin_bike_shop_new_path

      fill_in :item_price, with: 'a'
      fill_in :item_description, with: ''
      fill_in :item_title, with: ''
      select 'retired', from: :item_status

      click_button 'Create Item'

      expect(page).to have_content('Item cannot be created, please make sure to fill the form correctly')
    end
    it 'can create an item with a decimal price' do
      visit admin_bike_shop_new_path

      fill_in :item_price, with: 9000.01
      fill_in :item_description, with: 'brand new'
      fill_in :item_title, with: 'wheels'
      select 'retired', from: :item_status

      click_button 'Create Item'

      expect(page).to have_content('$9,000.01')
    end
    it 'can create an item with an image' do
      visit admin_bike_shop_new_path

      fill_in :item_image, with: 'http://img.mp.sohu.com/upload/20170814/3e04dea217c54cd7b8b8a00fa356a615_th.png'
      fill_in :item_price, with: 9000.01
      fill_in :item_description, with: 'brand new'
      fill_in :item_title, with: 'wheels'
      select 'retired', from: :item_status

      click_button 'Create Item'

      expect(page).to have_content('$9,000.01')
      expect(page).to have_css("img[src*='http://img.mp.sohu.com/upload/20170814/3e04dea217c54cd7b8b8a00fa356a615_th.png']")
    end
  end
end
