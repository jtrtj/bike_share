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

describe 'an admin' do
  before(:each) do
    @admin = create(:user, role: 1)
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  context 'logs in to their account' do
    it 'has a functional username and password' do
      visit root_path

      click_link 'Log In'
      expect(current_path).to eq(login_path)
      expect(page).to have_button('Login')

      fill_in :user_name, with: @admin.user_name
      fill_in :password, with: @admin.password
      click_on 'Login'

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("Logged in as Admin User: #{@admin.user_name}")
      expect(page).to have_content('Log Out')
      expect(page).to_not have_content('Login')
    end
    it 'can logout' do
      visit root_path

      click_link 'Log In'
      expect(current_path).to eq(login_path)
      expect(page).to have_button('Login')

      fill_in :user_name, with: @admin.user_name
      fill_in :password, with: @admin.password
      click_on 'Login'

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content('Log Out')
      expect(page).to have_content('Log In')
    end
    it 'sees their information' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_dashboard_index_path

      expect(page).to have_content("Welcome, #{@admin.user_name}")
      expect(page).to have_content(@admin.first_name)
      expect(page).to have_content(@admin.last_name)
      expect(page).to have_content(@admin.street_address)
      expect(page).to have_content(@admin.city)
      expect(page).to have_content(@admin.state)
      expect(page).to have_content(@admin.zip)
    end
  end
end
