require 'rails_helper'

describe 'An admin' do
  context 'visits station new' do
    it 'can fill a form and click Create Station and is directed to station show page and see flash message' do
      admin = create(:user)

      visit new_admin_station_path

      fill_in :name, with: 'Pier 44'
      fill_in :dock_count, with: 12
      fill_in :city, with: 'Bellevue'
      fill_in :installation_date, with: 2018-02-04

      click_button 'Create Station'
      expect(current_path).to eq(station_path(Station.last))
      expect(page).to have_content("#{Station.last.name} created!")
    end
  end
end
