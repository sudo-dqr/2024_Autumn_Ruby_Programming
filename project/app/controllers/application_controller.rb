class ApplicationController < ActionController::Base
  helper_method :current_user, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user && current_user.role.name == 'admin'
  end
end