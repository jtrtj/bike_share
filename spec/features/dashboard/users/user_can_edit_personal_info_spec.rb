require 'rails_helper'

describe "A user" do
  context "visits the user edit page" do
    it "fills out a form and updates user infomation" do
      new_address = "2411 12th Ave Ct"
      new_city = "Greeley"
      new_zip = 80631
      user = create(:user)

      visit root_path

      click_on 'Log In'

      fill_in :user_name, with: user.user_name
      # fill_in :first_name,	with: user.first_name 
      # fill_in :last_name,	with: user.last_name 
      # fill_in :street_address,	with: user.street_address 
      # fill_in :city,	with: user.city 
      # fill_in :state,	with: user.state 
      # fill_in :zip,	with: user.zip 
      fill_in :password, with: user.password

      click_button 'Login'

      click_on "Update My Info"

      fill_in :user_user_name,	with: user.user_name
      fill_in :user_first_name,	with: user.first_name
      fill_in :user_last_name,	with: user.last_name
      fill_in :user_street_address,	with: new_address
      fill_in :user_city,	with: new_city
      fill_in :user_zip,	with: new_zip
      fill_in :user_password,	with: user.password

      click_on 'Update User'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(new_address)
      expect(page).to have_content(new_city)
      expect(page).to have_content(new_zip)
    end
  end
end
