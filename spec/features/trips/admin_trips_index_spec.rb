require 'rails_helper'

describe "Admin user" do
  context "visits trips index page" do
    it "sees all attributes" do
      station = create(:station)
      trip = create(:trip, start_station: station, end_station: station)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

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
  end
end

=begin
As an admin user,
When I visit the trips index,
I see all attributes that a visitor can see,
I see a button next to each trip to edit that trip,
I also see a button next to each trip to delete that trip.
=end