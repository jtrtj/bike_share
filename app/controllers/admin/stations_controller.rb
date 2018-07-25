class Admin::StationsController < Admin::BaseController
  def new
    @station = Station.new
  end

  def create
    @station = Station.create(station_params)
    if @station.save
      redirect_to station_path(@station)
      flash[:notice] = "#{@station.name} created!"
    else
      flash[:notice] = "One of more fields are invalid"
      render :new
    end
  end

  def edit
    @station = Station.friendly.find(params[:id])
  end

  def update
    @station = Station.friendly.find(params[:id])
    old_station_name = @station.name
    @station.update(station_params)
    if @station.save
      flash[:notice] = "#{old_station_name} has been updated!"
      redirect_to station_path(@station)
    else
      flash[:notice] = "#{old_station_name} has not been updated!"
      render :edit
    end
  end

  def destroy
    station = Station.friendly.find(params[:id])
    station.destroy
    flash[:notice] = "#{station.name} was deleted!"
    redirect_to stations_path
  end

  private

  def station_params
    params.require(:station).permit(:name, :city, :dock_count, :installation_date)
  end
end
