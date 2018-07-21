require 'rails_helper'

describe 'A visitor' do
  context 'visits stations show page with station name url' do
    it 'sees stations with name, dock count, city, installation date, longitude and latitude' do
      station_1 = Station.create!(name: 'City hall', dock_count: 20, city: 'San Jose', installation_date: Time.now, latitude: 32.329732, longitude: -121.901, created_at: 2018-02-21, updated_at: 2018-03-21)

      visit '/city-hall'

      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)
      expect(page).to have_content(station_1.logitude)
      expect(page).to have_content(station_1.latitude)
    end
  end
end

=begin
As a visitor,
When I visit the station show
I see the url '/:station-name' with that station's name instead of :id,
I see all attributes for that station.

** All Attributes must be present **
=end