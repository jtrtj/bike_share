class StationsController < ApplicationController
  def index
    @stations = Station.paginate(page: params[:page])
  end

  def show
    @station = Station.friendly.find(params[:id])
  end

  def dashboard

  end 
end
