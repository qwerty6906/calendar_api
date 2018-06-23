class UserMailer < ApplicationMailer
  default from: 'notification@calendar.com'

  def notify_email
    @event = params[:event]
    @user = @event.user
    mail(to: @user.email, subject: "The '#{@event.title}' event will start in 10 munites.")
  end
end
