class Admin::DashboardController < Admin::BaseController
  def index
    @user = current_user
  end
end
