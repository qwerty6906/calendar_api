class UserMailer < ApplicationMailer
  default from: 'Heroku Calendar API <notification@calendar.com>'

  def notify_email
    @event = params[:event]
    @user = @event.user
    mail(to: "#{@user.name} <#{@user.email}>", subject: "The '#{@event.title}' event will start in 10 munites.")
  end
end
