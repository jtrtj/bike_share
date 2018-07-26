require 'rails_helper'
require 'faker'
describe 'a visitor' do
  context 'visit the root path' do
    it 'can click on a login button to go to a login page' do
      visit root_path

      click_link 'Log In'
      expect(current_path).to eq(login_path)
      expect(page).to have_button('Login')
      expect(page).to have_link('Create Account')
      expect(page).to have_field(:user_name)
      expect(page).to have_field(:password)
    end

    it 'can create account from login page' do
      user_name = 'Pol'
      password = 'Polpo'
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      address = Faker::Address.street_address
      city = Faker::Address.city
      state = Faker::Address.state
      zip = Faker::Address.zip

      visit login_path

      click_link 'Create Account'
      expect(current_path).to eq(new_user_path)

      fill_in :user_user_name, with: user_name
      fill_in :user_password, with: password
      fill_in :user_first_name,	with: first_name
      fill_in :user_last_name,	with: last_name
      fill_in :user_street_address,	with: address
      fill_in :user_city,	with: city
      fill_in :user_state,	with: state
      fill_in :user_zip,	with: zip

      click_button 'Sign Up'

      expect(current_path).to eq(dashboard_path)

      within '.navbar' do
        expect(page).to have_content("Logged in as #{user_name}")
      end

      expect(page).to_not have_link('Log In')
      expect(page).to have_link('Log Out')
    end
  end
end
