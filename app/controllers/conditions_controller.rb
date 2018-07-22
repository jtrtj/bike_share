class ConditionsController < ApplicationController
  def index
    @conditions = Condition.paginate(page: params[:page])
  end

  def show
    @condition = Condition.find(params[:id])
  end
end
