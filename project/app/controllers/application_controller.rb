class ApplicationController < ActionController::Base
  helper_method :current_user, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user && current_user.role.name == 'admin'
  end

  def authenticate_admin!
    redirect_to root_path, alert: '需要管理员访问权限' unless admin?
  end
end