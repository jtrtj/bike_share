class DashboardController < ApplicationController

  def show
    if current_user.nil?
      render file: 'public/404.html'
    else
      @user = current_user
    end
  end
end
