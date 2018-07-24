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
  end

end
