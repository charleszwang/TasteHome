class AdminDashboardController < ApplicationController
  def index
    @users = User.all
  end
  
  def turn_cook
    @cook = params[:cook_user]
  end  
end
