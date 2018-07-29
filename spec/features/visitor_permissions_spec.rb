require 'rails_helper'

describe 'a visitor' do
  context 'trying to see user data' do
    it "cannot view another user's private data" do
      user = create(:user)
      order = user.orders.create
      
      visit dashboard_path(user)
      expect(page).to have_content("The page you were looking for doesn't exist.")
      
      visit order_path(order)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  context 'trying to checkout' do
    it 'will be asked to log in when clicking checkout from cart' do
      visit cart_path

      click_on 'Checkout'

      expect(current_path).to eq(login_path)
    end
  end

  context 'trying to do admin stuff' do
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