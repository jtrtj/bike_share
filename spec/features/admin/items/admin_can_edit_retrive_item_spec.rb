require 'rails_helper'

describe 'An admin' do
  describe 'visiting the bike shop items' do
    before :each do
      @admin = create(:user, role: 1)
      @item = Item.create(title: 'bike lights', description: 'wonderful led', price: 10, image: 'https://www.elegantthemes.com/blog/wp-content/uploads/2015/02/custom-trackable-short-url-feature.png', status: 1)
      @item2 = Item.create(title: 'wheels', description: 'circle', price: 90, image: 'https://www.elegantthemes.com/blog/wp-content/uploads/2015/02/custom-trackable-short-url-feature.png', status: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    it 'can edit accessory or retire/reactivate accessory' do

      visit admin_bike_shop_path

      expect(page).to have_button('Edit')

      within "#item-#{@item.id}" do
        click_button 'Edit'
      end
      expect(current_path).to eq(admin_item_path(@item.id))

      fill_in :item_title, with: 'book'
      fill_in :item_description, with: 'great story'
      fill_in :item_price, with: 45

      click_button 'Update Item'

      expect(current_path).to eq(admin_bike_shop_path)
      expect(page).to have_content('book')
      expect(page).to have_content("great story")
      expect(page).to have_content(45)
    end
    it 'can see see button to retire or reactivate an item' do
      visit admin_bike_shop_path

      within "#item-#{@item.id}" do
        click_button 'Retire'
      end
      within "#item-#{@item.id}" do
        expect(page).to have_content('retired')
      end

      within "#item-#{@item2.id}" do
        click_button 'Reactivate'
      end
      within "#item-#{@item2.id}" do
        expect(page).to have_content('active')
      end

    end
  end
end
