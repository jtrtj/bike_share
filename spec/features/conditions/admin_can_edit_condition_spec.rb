require 'rails_helper'

describe 'an admin' do
  context 'visiting conditions index' do
    it 'can delete a condition and view an accompanying flash message' do
      admin = create(:user, role: 1)

      condition_1 = create(:condition, max_temperature_f: 500)
      condition_2 = create(:condition, max_temperature_f: 400)

      old_max = condition_1.max_temperature_f

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_condition_path(condition_1)

      max = 5000
      mean = 4000
      min = 3000
      fill_in :condition_date, with: Date.today
      fill_in :condition_max_temperature_f, with: max
      fill_in :condition_mean_temperature_f, with: mean
      fill_in :condition_min_temperature_f, with: min
      fill_in :condition_mean_humidity, with: 400
      fill_in :condition_mean_visibility_miles, with: 467
      fill_in :condition_mean_wind_speed_mph, with: 888
      fill_in :condition_precipitation_inches, with: 87
      click_on 'Update Condition'

      expect(current_path).to eq(conditions_path)
      expect(page).to_not have_content(old_max)
      expect(page).to have_content("Condition for #{condition_1.date} was updated!")
    end
  end
end
