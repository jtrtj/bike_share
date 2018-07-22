require 'rails_helper'

describe 'An admin' do
  context 'visiting stations index' do
    before(:each) do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    end

    it 'will see all stations info with a delete and edit button for each station' do
      station = create(:station)

      visit stations_path
      
      within "#station-#{station.id}" do
        expect(page).to have_content(station.name)
        expect(page).to have_content(station.dock_count)
        expect(page).to have_content(station.city)
        expect(page).to have_content(station.installation_date)
        expect(page).to have_button('Edit')
        expect(page).to have_button('Delete')
      end
    end


    it 'can delete a station from the stations index' do
      station_1 = create(:station, name: 'station 1')
      station_2 = create(:station, name: 'station 2')

      visit stations_path
      
      within "#station-#{station_1.id}" do
        click_button 'Delete'
      end

      expect(page).to_not have_content(station_1.name)
      expect(page).to_not have_content(station_1.dock_count)
      expect(page).to_not have_content(station_1.city)
      expect(page).to_not have_content(station_1.installation_date)
      
      expect(page).to have_content(station_2.name)
      expect(page).to have_content(station_2.dock_count)
      expect(page).to have_content(station_2.city)
      expect(page).to have_content(station_2.installation_date)
    end
  end
end

