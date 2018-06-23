module MailerHelper
  def format_time(time, format: '%H:%M', timezone: nil)
    time.in_time_zone(timezone).strftime(format)
  end
end