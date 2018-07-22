require 'rails_helper'

describe "A visitor" do
  context "visits trips index page" do
    it "sees duration, start date, start station, end date, end station, bike id, subscription type, zip code of a trip" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station)

      visit trips_path

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.start_station_id)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.end_station_id)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
    it 'see the first 30 trips and a button to see more pages of trips' do
      station = create(:station)
      trips = 29.times do
        create(:trip, start_station: station, end_station: station)
      end
      trip30 = create(:trip, bike_id: 1234, start_station: station, end_station: station)
      trip31 = create(:trip, bike_id: 5678, start_station: station, end_station: station)
      trips_page_2 = 50.times do
        create(:trip, start_station: station, end_station: station)
      end

      visit trips_path

      expect(page).to have_content(trip30.bike_id)
      expect(page).to_not have_content(trip31.bike_id)
      expect(page).to have_content("Previous")
      expect(page).to have_content("Next")
    end
    it 'on the second page, there should be buttons to move both forward and backward in time.' do
      station = create(:station)
      trips = 75.times do
        create(:trip, start_station: station, end_station: station)
      end
      last_trip = create(:trip, bike_id: 1234567, start_station: station, end_station: station)


      visit trips_path
      click_on "Next"

      expect(page).to have_content("Previous")
      expect(page).to have_content("Next")

      click_on "Next"

      expect(page).to have_content(last_trip.bike_id)
    end
  end
end

=begin
As a visitor,
When I visit the trips index,

When I visit a second page, there should be buttons to move both forward and backward in time.

** All Attributes must be present **

=end
