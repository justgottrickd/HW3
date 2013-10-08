class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user

  def set_current_user
     @current_user||=session[:session_token] && User.find_by_session_token(session[:session_token])
  end


end
