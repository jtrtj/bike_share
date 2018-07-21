require 'rails_helper'

describe Condition, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:max_temperature_f}
    it {should validate_presence_of(:mean_temperature_f}
    it {should validate_presence_of(:min_temperature_f}
    it {should validate_presence_of(:mean_humidity}
    it {should validate_presence_of(:mean_visibility_miles}
    it {should validate_presence_of(:mean_wind_speed_mph}
    it {should validate_presence_of(:precipitation_inches)}
  end
  describe 'relationships' do
  end
end
