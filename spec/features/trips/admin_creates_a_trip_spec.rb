require 'rails_helper'

describe "An admin user" do
  context "visits admin trip new" do
    it "fills out a for with all attributes, clicks 'Create Trip' and is redirected to the trip show page" do
      station1 = create(:station)
      station2 = create(:station, name: "toto")
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path
      click_on "Create Trip"

      expect(current_path).to eq(new_admin_trip_path)
      
      fill_in :trip_duration,	with: 120
      fill_in :trip_start_date,	with: Date.today
      select(station1.name, from: 'Start station')
      fill_in :trip_end_date,	with: Date.today
      select(station2.name, from: 'End station')
      fill_in :trip_bike_id, with: 15
      fill_in :trip_subscription_type,	with: "Subscriber"
      fill_in :trip_zip_code,	with: 91112

      click_on "Create Trip"

      expect(current_path).to eq(trip_path(Trip.last))
      expect(page).to have_content("2 Minutes")
      expect(page).to have_content(Date.today)
      expect(page).to have_content(station1.name)
      expect(page).to have_content(station1.id)
      expect(page).to have_content(station2.name)
      expect(page).to have_content(station2.id)
      expect(page).to have_content(15)
      expect(page).to have_content("Subscriber")
      expect(page).to have_content(91112)
      expect(page).to have_content("Trip created!") 
    end
  end
end
