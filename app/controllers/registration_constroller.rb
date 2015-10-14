class RegistrationController < Devise::RegistrationsController
  def create
    super
      resource = resource.becomes(Member)
      resource.type = "Member"
      resoure.save!
  end
end