require 'rails_helper'


describe "Admin user" do
  context "visits trips show page" do
    it "sees everything a visitor can see" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station, duration: 120)
      admin = create(:user, role: 1)

      visit trip_path(trip)

      expect(page).to have_content(trip.duration / 60)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.start_station_name)
      expect(page).to have_content(trip.start_station_id)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.end_station_name)
      expect(page).to have_content(trip.end_station_id)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
  end
end

=begin
As an admin user,
When I visit the trip show,
I see everything a visitor can see,
I see a button to delete this trip,
I also see a button to edit this trip.

** All Attributes must be present **
=end