require 'rails_helper'

describe 'An admin' do
  context 'visits station new' do
    it 'can fill a form and click Create Station and is directed to station show page and see flash message' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_station_path
      
      fill_in :station_name, with: 'Pier 44'
      fill_in :station_dock_count, with: 12
      fill_in :station_city, with: 'Bellevue'
      fill_in :station_installation_date, with: Time.now

      click_button 'Create Station'

      expect(current_path).to eq(station_path(Station.last))
      expect(page).to have_content("#{Station.last.name} created!")
    end
  end
end
