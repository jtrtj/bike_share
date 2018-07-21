require 'rails_helper'

describe 'A visitor' do
  scenario 'visits stations index' do
    it 'sees all stations with name, dock count, city, installation date' do
      station_1 = Station.create(name: 'City hall', dock_count: 20, city: 'San Jose', installation_date: 2018-02-21, created_at: 2018-02-21, updated_at: 2018-03-21)
      station_2 = Station.create(name: 'South Blvd', dock_count: 15, city: 'San Jose', installation_date: 2018-01-11, created_at: 2018-01-11, updated_at: 2018-02-11)

      visit stations_path

      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)

      expect(page).to have_content(station_2.name)
      expect(page).to have_content(station_2.dock_count)
      expect(page).to have_content(station_2.city)
      expect(page).to have_content(station_2.installation_date)
    end
  end
end
