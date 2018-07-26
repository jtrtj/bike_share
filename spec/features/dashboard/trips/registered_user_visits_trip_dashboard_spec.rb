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
    it 'sees a month by month breakdown of trips with a yearly subtotal' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, start_date: DateTime.strptime('4/4/2016', '%m/%d/%Y'), start_station: station_1, end_station: station_2, duration: 120)
      trip2 = create(:trip, start_date: DateTime.strptime('4/5/2016', '%m/%d/%Y'), start_station: station_2, end_station: station_1, duration: 60)
      trip3 = create(:trip, start_date: DateTime.strptime('5/5/2016', '%m/%d/%Y'), start_station: station_2, end_station: station_1, duration: 30)
      trip4 = create(:trip, start_date: DateTime.strptime('5/6/2017', '%m/%d/%Y'), start_station: station_1, end_station: station_2, duration: 120)
      trip5 = create(:trip, start_date: DateTime.strptime('7/7/2017', '%m/%d/%Y'), start_station: station_2, end_station: station_1, duration: 60)
      trip6 = create(:trip, start_date: DateTime.strptime('7/8/2017', '%m/%d/%Y'), start_station: station_2, end_station: station_1, duration: 30)
      year_1 = '2016'
      year_2 = '2017'

      visit trips_dashboard_path

      expect(page).to have_content(year_1)
      expect(page).to have_content(year_2)
      expect(page).to have_content("Total trips for May of 2016")
      expect(page).to have_content("Total trips for July of 2017")
    end
    it 'shows most ridden bike with number of rides' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip2 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip3 = create(:trip, bike_id: 2, start_station: station_1, end_station: station_2)
      trip4 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip5 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip6 = create(:trip, bike_id: 2, start_station: station_1, end_station: station_2)
      special_bike = 3
      rides = 4

      visit trips_dashboard_path

      expect(page).to have_content("The ID  of the most ridden bike is #{special_bike}, with #{rides} number of rides")
    end
    it 'shows least ridden bike with number of rides' do
      user = create(:user)
      station_1 = create(:station, name: 'Omlette')
      station_2 = create(:station, name: 'Fromage')
      trip = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip2 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip3 = create(:trip, bike_id: 2, start_station: station_1, end_station: station_2)
      trip4 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip5 = create(:trip, bike_id: 3, start_station: station_1, end_station: station_2)
      trip6 = create(:trip, bike_id: 2, start_station: station_1, end_station: station_2)
      special_bike = 2
      rides = 2

      visit trips_dashboard_path

      expect(page).to have_content("The ID  of the least ridden bike is #{special_bike}, with #{rides} number of rides")
    end
  end
end
