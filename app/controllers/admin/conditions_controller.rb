class Admin::ConditionsController < Admin::BaseController

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.create(condition_params)
    if @condition.save
      flash[:notice] = "Condition for #{@condition.date} was created!"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = "Condition fields invalid"
      redirect_to new_admin_condition_path
    end
  end

  def destroy
    condition = Condition.find(params[:id])
    deleted_date = condition.date
    condition.destroy

    flash[:notice] = "Condition for #{deleted_date} was deleted!"
    redirect_to conditions_path
  end

  private
  def condition_params
    params.require(:condition).permit(:date, :max_temperature_f, :mean_temperature_f, :min_temperature_f, :mean_humidity, :mean_visibility_miles, :mean_wind_speed_mph, :precipitation_inches)
  end
end
