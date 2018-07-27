require 'rails_helper'

describe "A user" do
  context "logs in" do
    it "sees 'Logged in as [user name]" do
      user = create(:user)

      visit '/'

      click_on "Log In"

      fill_in :user_name, with: user.user_name
      fill_in :password, with: user.password

      click_on "Login"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content "Logged in as #{user.user_name}"
    end

    it 'sees profile information' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to have_content("Welcome, #{user.user_name}")
      expect(page).to have_content(user.first_name) 
      expect(page).to have_content(user.last_name) 
      expect(page).to have_content(user.street_address) 
      expect(page).to have_content(user.city) 
      expect(page).to have_content(user.state) 
      expect(page).to have_content(user.zip) 
    end

    it "Doesn't see a link to log in" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to_not have_content("Log In") 
      expect(page).to have_content("Log Out") 
    end
  end
end

=begin
I do not see a link for "Login",
I see a link for "Logout".
=end