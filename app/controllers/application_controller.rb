class ApplicationController < ActionController::API
  def current_user
    @current_user ||= User.find_by(email: 'evseev.anton@gmail.com')
  end
end
