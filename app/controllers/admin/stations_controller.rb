class Admin::StationsController < Admin::BaseController

  def destroy
    station = Station.find(params[:id])
    station.destroy

    redirect_to stations_path
  end

end
