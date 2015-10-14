# Preview all emails at http://localhost:3000/rails/mailers/model_mailer
class ModelMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/model_mailer/new_record_notification
  def new_record_notification
    user = User.last
    ModelMailer.new_record_notification(user)
  end

end
