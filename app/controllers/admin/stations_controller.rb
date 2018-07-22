class Admin::StationsController < Admin::BaseController

  def destroy
    station = Station.find(params[:id])
    deleted_station_name = station.name
    station.destroy

    flash[:notice] = "#{deleted_station_name} was deleted!"
    redirect_to stations_path
  end

end
