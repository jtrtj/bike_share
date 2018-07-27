require 'rails_helper'

describe 'An admin' do
  describe 'visiting bike shop new' do
    before :each do
      @admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it 'can create a new item' do

      visit new_admin_item_path

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

      visit new_admin_item_path

      fill_in :item_price, with: 'a'
      fill_in :item_description, with: ''
      fill_in :item_title, with: ''
      select 'retired', from: :item_status

      click_button 'Create Item'

      expect(page).to have_content('Item cannot be created, please make sure to fill the form correctly')
    end
  end
end

=begin
As an admin user,
When I visit admin bikeshop new
I can create an accessory,
An accessory must have a title, description and price,
The title and description cannot be empty,
The title must be unique for all accessories in the system,
The price must be a valid decimal numeric value and greater than zero,
The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
=end
