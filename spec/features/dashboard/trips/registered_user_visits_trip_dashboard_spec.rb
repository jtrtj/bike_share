require 'rails_helper'

describe 'A registered user' do
  context 'visiting trips dashboard' do
    it 'sees the average duration of a ride' do
      user = create(:user)
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trips_dashboard_path

      expected_result = 70

      expect(page).to have_content("Average duration of a ride : #{expected_result}")
    end

    it 'sees the longest duration trip' do
      user = create(:user)
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      visit trips_dashboard_path

      expected_result = trip

      expect(page).to have_content("Longest ride : #{expected_result.id}")

    end

    it 'sees the shortest duration trip' do
      user = create(:user)
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      trip2 = create(:trip, start_station: station, end_station: station, duration: 60)
      trip3 = create(:trip, start_station: station, end_station: station, duration: 30)

      visit trips_dashboard_path

      expected_result = trip3
      expect(page).to have_content("Shortest ride : #{expected_result.id}")
    end

    it 'sees the station with the most rides originating from it and the station with the most rides ending at it' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, start_station: station_1, end_station: station_1, duration: 120)
      trip2 = create(:trip, start_station: station_1, end_station: station_2, duration: 60)
      trip3 = create(:trip, start_station: station_1, end_station: station_2, duration: 30)

      visit trips_dashboard_path

      expect(page).to have_content("Station with most rides originating: #{station_1.name}")
      expect(page).to have_content("Station with most rides ending: #{station_2.name}")
    end
  end
end
