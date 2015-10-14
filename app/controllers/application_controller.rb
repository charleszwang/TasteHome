class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :null_session
  # def current_user
#     # if current_member    # You could use candidate_signed_in? instead.
# #       current_member    #
# #     # elsif current_cook
# #     #   current_cook
# #     else
#     # if current_user
#  #      current_user
#  #    else
#  #      false
#  #    end
#   end
#
  def user_signed_in?
    if current_user
      return true
    return false
    end
  end
  
  ActionDispatch::Callbacks.after do
    # Reload the factories
    return unless (Rails.env.development? || Rails.env.test?)

    unless FactoryGirl.factories.blank? # first init will load factories, this should only run on subsequent reloads
      FactoryGirl.factories.clear
      FactoryGirl.find_definitions
    end
  end
end
