require 'rails_helper'

describe "A visitor" do
  context "visits the trip show page" do
    it "sees a list of all attributes of a trip" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)

      visit trip_path(trip)

      expect(page).to have_content(trip.duration / 60)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.start_station.name)
      expect(page).to have_content(trip.start_station_id)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.end_station.name)
      expect(page).to have_content(trip.end_station_id)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
  end
end
