class ApplicationController < ActionController::API
  AUTH_HEADER = 'HTTP_AUTHORIZATION'
  before_action :authenticate
  def current_user
    if auth_present?
      user = User.find(auth[:sub])
      @current_user ||= user if user
    end
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    render json: {error: 'unauthorized'}, status: 401 unless logged_in?
  end

  private

  def auth_present?
    !!request.env.fetch(AUTH_HEADER, '').scan(/Bearer/).first
  end

  def auth
    JsonWebToken.decode token
  end

  def token
    request.env[AUTH_HEADER].scan(/Bearer (.*)$/).flatten.last
  end

end
