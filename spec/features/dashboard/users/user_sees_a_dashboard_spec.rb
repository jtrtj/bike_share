require 'rails_helper'

describe "A user" do
  context "logs in" do
    it "and sees 'Logged in as [user name]" do
      user = create(:user)

      visit '/'

      click_on "Log In"

      fill_in :user_name, with: user.user_name
      fill_in :password, with: user.password

      click_on "Login"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content "Logged in as #{user.user_name}"
    end
  end
end

=begin
As a registered user,
When I visit "/",
I see a link for "Login",

When I click "Login",
I should be on the "/login" page,
I see a place to insert my credentials to login,
I fill in my desired credentials,
I submit my information,
My current page should be "/dashboard",
I see a message in the navbar that says "Logged in as SOME_USER",
I see my profile information,
I do not see a link for "Login",
I see a link for "Logout".
=end