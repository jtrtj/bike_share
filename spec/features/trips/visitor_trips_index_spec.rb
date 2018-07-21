require 'rails_helper'

describe "A visitor" do
  context "visits trips index page" do
    it "sees duration, start date, start station, end date, end station, bike id, subscription type, zip code of a trip" do
      station1 = create(:station)
      station2 = create(:station)
      trips = create(:trip, start_station: station1, end_station: station2)

      visit trips_index

      expect(page).to have_content(trip.duration) 
      expect(page).to have_content(trip.start_date) 
      expect(page).to have_content(trip.start_station) 
      expect(page).to have_content(trip.end_date) 
      expect(page).to have_content(trip.end_station) 
      expect(page).to have_content(trip.bike_id) 
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)

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
