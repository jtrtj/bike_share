require 'rails_helper'

describe 'a visitor' do
  context 'visit the root path' do
    it 'can click on a login button to go to a login page' do
      visit root_path

      click_link 'Log In'
      expect(current_path).to eq(login_path)
      expect(page).to have_button('Login')
      expect(page).to have_field(:user_user_name)
      expect(page).to have_field(:user_password)
    end

    it 'can create account from login page' do

    end
  end
end
