class CookDashboardController < ApplicationController
  def profile
    @cook = Cook.find(current_user.id)
  end
end
