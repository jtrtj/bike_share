require 'rails_helper'

describe 'a registered user' do
  before(:each) do
    @user = create(:user)
  end
  context 'logs in to their account' do
    it 'has a functional username and password' do
      visit root_path

      click_link 'Log In'
      expect(current_path).to eq(login_path)
      expect(page).to have_button('Login')

      fill_in :user_name, with: @user.user_name
      fill_in :password, with: @user.password
      click_on 'Login'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{@user.user_name}")
      expect(page).to have_content('Log Out')
      expect(page).to_not have_content('Login')
    end
    it 'can logout' do
      visit root_path

      click_link 'Log In'
      expect(current_path).to eq(login_path)
      expect(page).to have_button('Login')

      fill_in :user_name, with: @user.user_name
      fill_in :password, with: @user.password
      click_on 'Login'

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content('Log Out')
      expect(page).to have_content('Log In')
    end
  end
end
