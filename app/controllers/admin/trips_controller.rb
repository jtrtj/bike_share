class Admin::TripsController < Admin::BaseController

  def update
    
  end

  def edit
    @trip = Trip.find(params[:id])
  end
end