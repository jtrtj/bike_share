require 'rails_helper'

describe 'A visitor' do
  context 'visits stations show page with station name url' do
    it 'sees stations with name, dock count, city, installation date, longitude and latitude' do
      station_1 = Station.create!(name: 'City hall', dock_count: 20, city: 'San Jose', installation_date: Time.now, created_at: 2018-02-21, updated_at: 2018-03-21)

      visit '/city-hall'

      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date.strftime('%b %d %Y'))
    end
  end

  context 'a registered user visiting station show' do

    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'sees number of rides started and ended at this station' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'hooplah')

      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)

      trip_3 = create(:trip,start_station_id: station_2.id, end_station_id: station_1.id)

      visit station_path(station_1)

      expect(page).to have_content("Trips started at this station 2")
      expect(page).to have_content("Trips ended at this station 1")
    end

    it 'sees the most frequent destination for rides that begin at this station' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'Union')
      station_3 = create(:station, name: 'Moes')

      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id)
      trip_3 = create(:trip, start_station_id: station_1.id, end_station_id: station_3.id)
      trip_4 = create(:trip,start_station_id: station_3.id, end_station_id: station_1.id)

      visit station_path(station_1)

      expect(page).to have_content("Most frequent destination station from here #{station_2.name}")
    end
    it 'sees the most frequent origin for rides that end at this station' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'Union')
      station_3 = create(:station, name: 'Moes')

      trip_1 = create(:trip, start_station_id: station_2.id, end_station_id: station_1.id)
      trip_2 = create(:trip, start_station_id: station_2.id, end_station_id: station_1.id)
      trip_3 = create(:trip, start_station_id: station_2.id, end_station_id: station_1.id)
      trip_4 = create(:trip,start_station_id: station_3.id, end_station_id: station_1.id)

      visit station_path(station_1)

      expect(page).to have_content("Most frequent origin station to here #{station_2.name}")
    end

    it 'seees the date with the most trips starting at the station' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'Union')

      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id, start_date: Date.today)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id, start_date: Date.today)
      trip_3 = create(:trip,start_station_id: station_1.id, end_station_id: station_2.id, start_date: Date.yesterday)

      visit station_path(station_1)
      yuh = Date.today

      expect(page).to have_content("Date with the highest number of trips started here #{yuh.strftime('%b %d %Y')}")
    end

    it 'sees the most frequent zip code users entered on trips starting at this station' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'Union')

      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id, zip_code: 38112)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id, zip_code: 38112)
      trip_3 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id, zip_code: 38104)

      visit station_path(station_1)

      expect(page).to have_content("Most Frequent Zip Code 38112")
    end

    it 'sees the bike id most frequently starting trips at the station' do
      station_1 = create(:station)
      station_2 = create(:station, name: 'Union')

      trip_1 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id, bike_id: 1)
      trip_2 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id, bike_id: 1)
      trip_3 = create(:trip, start_station_id: station_1.id, end_station_id: station_2.id, bike_id: 2)

      visit station_path(station_1)

      expect(page).to have_content("ID of bike most frequently starting trips here 1")
    end
  end
end
