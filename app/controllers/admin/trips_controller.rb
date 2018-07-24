class Admin::TripsController < Admin::BaseController

  def update
    @trip = Trip.find(params[:id])
    old_trip_name = @trip.id
    @trip.update(trip_params)
    if @trip.save
      flash[:notice] = "#{old_trip_name} has been updated!"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "#{old_trip_name} has not been updated!"
      render :edit
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end
end