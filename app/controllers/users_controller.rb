class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    
  end

  private

  def user_params
    params.require(:user).permit(:user_name,
                                 :password,
                                 :first_name,
                                 :last_name,
                                 :street_address,
                                 :city,
                                 :state,
                                 :zip)
  end

end
