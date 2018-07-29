require 'rails_helper'

describe "A user" do
  context "visits the user edit page" do
    it "fills out a form and updates user infomation" do
      new_address = "2411 12th Ave Ct"
      new_city = "Greeley"
      new_zip = 80631
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

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
