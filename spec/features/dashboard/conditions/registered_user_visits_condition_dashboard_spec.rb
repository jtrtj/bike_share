require 'rails_helper'
=begin
When I visit '/conditions-dashboard',
I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees),
=end

describe 'A registered user' do
  context 'visiting dashboard' do
    before :each do
      condition = create(:condition, date: DateTime.strptime('8/15/2015 16:45', '%m/%d/%Y'), max_temperature_f: 93)
      trip_1 = create(:trip, start_date: DateTime.strptime('8/15/2015 16:45', '%m/%d/%Y'))
      trip_2 = create(:trip, start_date: DateTime.strptime('8/15/2015 16:45', '%m/%d/%Y'))
      trip_3 = create(:trip, start_date: DateTime.strptime('8/15/2015 16:45', '%m/%d/%Y'))
    end
    it 'sees the average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks' do



    end
  end
end
