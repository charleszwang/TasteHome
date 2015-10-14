class DashboardController < ApplicationController
  def index
    if current_user.admin
      redirect_to admin_path and return
    elsif current_user.type == "Cook"
      redirect_to cook_path and return
    end
    @cooks = Cook.all
  end

  def address
    @user = current_user
    if current_user.address?
      @address = current_user.address
    else
      @address = "Empty. Please update your address"
    end
  end
  
  def update
    @address = params[:member][:address]
    current_user.address = @address
    current_user.save!
    redirect_to user_address_path
  end
  
end
