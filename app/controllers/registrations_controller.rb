class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.save
      # refactor later. assigning new value to resource makes resource nil
      r = resource.becomes(Member)
      r.type = "Member"
      resource = r
      resource.save!
    end
  end
end
