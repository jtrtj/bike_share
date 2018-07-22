class Admin::StationsController < Admin::BaseController
  def new
    @station = Station.new
  end

  def destroy
    station = Station.find(params[:id])
    deleted_station_name = station.name
    station.destroy

    flash[:notice] = "#{deleted_station_name} was deleted!"
    redirect_to stations_path
  end

end
