# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def notify_email
    UserMailer.with(event: Event.first).notify_email
  end
end
