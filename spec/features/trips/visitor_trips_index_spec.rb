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
      29trips = create(:trip, 29)
      trip30 = create(:trip)
      trip31 = create(:trip)

      visit trips_path

      expect(page).to have_content(29trips)
      expect(page).to have_content(trip30)
      expect(page).to_not have_content(trip31)
    end
  end
end

=begin
As a visitor,
When I visit the trips index,
I see the first 30 trips (duration, start date, start station, end date, end station, bike id, subscription type, zip code),
I also see a button to see more pages of trips,

When I visit a second page, there should be buttons to move both forward and backward in time.

** All Attributes must be present **

=end
