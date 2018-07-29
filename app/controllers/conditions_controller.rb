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
  end
end
