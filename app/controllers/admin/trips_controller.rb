class Admin::TripsController < Admin::BaseController

  def new
    @trip = Trip.new
  end

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

  private

  def trip_params
    params.require(:trip).permit(:duration, 
                                 :start_date,
                                 :start_station_name,
                                 :start_station_id,
                                 :end_date,
                                 :end_station_name,
                                 :end_station_id,
                                 :bike_id,
                                 :subscription_type,
                                 :zip_code
                                 )
  end
end