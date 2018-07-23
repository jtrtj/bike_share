require 'rails_helper'

describe 'An admin' do
  context 'visits condition show' do
    it "sees an edit button and a delete button" do
      admin = create(:user, role: 1)
      condition_1 = Condition.create!(date: Time.now, max_temperature_f: 90.0, mean_temperature_f: 80.0, min_temperature_f: 70.0, mean_humidity: 60.0, mean_visibility_miles: 70.0, mean_wind_speed_mph: 30.0, precipitation_inches: 25.0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit condition_path(condition_1)

      expect(page).to have_content("Condition: #{condition_1.id}")
      expect(page).to have_content(condition_1.date)
      expect(page).to have_content(condition_1.max_temperature_f)
      expect(page).to have_content(condition_1.mean_temperature_f)
      expect(page).to have_content(condition_1.min_temperature_f)
      expect(page).to have_content(condition_1.mean_humidity)
      expect(page).to have_content(condition_1.mean_visibility_miles)
      expect(page).to have_content(condition_1.mean_wind_speed_mph)
      expect(page).to have_content(condition_1.precipitation_inches)
      expect(page).to have_button('Edit')
      expect(page).to have_button('Delete')
    end
  end
end
