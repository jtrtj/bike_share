require 'rails_helper'

describe 'a registered user' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  context "trying to view another user's private data" do
    it 'gets a 404' do
      user_2 = create(:user)
      order = user_2.orders.create
      
      visit order_path(order)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  context 'trying to use admin screens and fucntions' do
    it 'cannot view admin screens or use admin functionality' do
      visit admin_dashboard_index_path
      expect(page).to have_content("The page you were looking for doesn't exist.")

      visit admin_bike_shop_path
      expect(page).to have_content("The page you were looking for doesn't exist.")

      visit new_admin_item_path
      expect(page).to have_content("The page you were looking for doesn't exist.")

      visit new_admin_trip_path
      expect(page).to have_content("The page you were looking for doesn't exist.")

      visit new_admin_condition_path
      expect(page).to have_content("The page you were looking for doesn't exist.")

      visit new_admin_station_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'cannot sign up as an admin' do
      visit new_user_path

      expect(page).to_not have_content("admin")
      expect(page).to_not have_content("Admin")
    end
  end
end