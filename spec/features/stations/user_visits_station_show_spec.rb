require 'rails_helper'

describe 'A visitor' do
  context 'visits stations show page with station name url' do
    it 'sees stations with name, dock count, city, installation date, longitude and latitude' do
      station_1 = Station.create!(name: 'City hall', dock_count: 20, city: 'San Jose', installation_date: Time.now, created_at: 2018-02-21, updated_at: 2018-03-21)
      
      visit '/city-hall'
      
      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)
    end
  end
  
  context 'a registered user visiting station show' do

    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'sees number of rides started and ended at this station' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'fake')

      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)

      trip_3 = create(:trip,start_station_id: station_2.id, end_station_id: station_1.id)

      visit station_path(station_1)

      expect(page).to have_content("Number of rides started at this station #{station_1.trips_started_here.length}")
      expect(page).to have_content("Number of rides ended at this station #{station_1.trips_ended_here.length}")
    end
  end
end
