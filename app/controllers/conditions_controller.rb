class ConditionsController < ApplicationController
  def index
    @conditions = Condition.paginate(page: params[:page])
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def dashboard
    by_temp_range = ConditionsData.new(Condition.trip_numbers_by_temp_range)
    @all_trips_by_temp = by_temp_range.all_rides_by_temp_range(40..99)
    by_precipitation = ConditionsData.new(Condition.trip_numbers_by_precipitation)
    @all_trips_by_precipitation = by_precipitation.all_rides_by_precipitation(0.0..3.0)
    by_wind_speed = ConditionsData.new(Condition.trip_numbers_by_wind_speed)
    @all_trips_by_wind_speed = by_wind_speed.all_rides_by_wind_speed(4.0..20.0)
    by_visibility = ConditionsData.new(Condition.trip_numbers_by_visibility)
    @all_trips_by_visibility = by_visibility.all_rides_by_visibility(4.0..20.0)
  end
end
