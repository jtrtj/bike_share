require 'rails_helper'

describe 'an admin' do
  context 'from stations index can edit a station' do
    it 'can fill in a form to edit the station it clicks' do
      admin = create(:user, role: 1)
      station = create(:station)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit stations_path

      within "#station-#{station.id}" do
        click_on 'Edit'
      end

      expect(current_path).to eq(edit_admin_station_path(station.id))

      fill_in :station_name, with: 'Pier 44'
      fill_in :station_dock_count, with: 12
      fill_in :station_city, with: 'Bellevue'
      fill_in :station_installation_date, with: Time.now

      click_button 'Update Station'

      expect(current_path).to eq(station_path(station))
      expect(page).to have_content('Pier 44')
      expect(page).to have_content("12")
      expect(page).to have_content("Bellevue")
      expect(page).to have_content(Time.now.year)
    end
  end
end
