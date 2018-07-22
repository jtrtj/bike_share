require 'rails_helper'

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

      visit login_path

      click_link 'Create Account'
      expect(current_path).to eq(new_user_path)

      fill_in :user_user_name, with: user_name
      fill_in :user_password, with: password
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
