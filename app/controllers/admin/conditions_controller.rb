class Admin::ConditionsController < Admin::BaseController

  def destroy
    condition = Condition.find(params[:id])
    deleted_date = condition.date
    condition.destroy

    flash[:notice] = "Condition for #{deleted_date} was deleted!"
    redirect_to conditions_path
  end
end
