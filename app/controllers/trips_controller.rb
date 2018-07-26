class TripsController < ApplicationController

  def index
    @trips = Trip.paginate(page: params[:page])
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def dashboard
    @trips = Trip.all
    @station_with_most_rides_originating = Trip.station_with_most_rides_originating
    @station_with_most_rides_ending = Trip.station_with_most_rides_ending
    @trips_by_year = Trip.year_by_year
    @trips_by_month = Trip.month_by_month
    @most_ridden_bike = Trip.most_ridden_bike
    @most_bike_rides = Trip.most_bike_rides
    @least_ridden_bike = Trip.least_ridden_bike
    @least_bike_rides = Trip.least_bike_rides
  end

end
