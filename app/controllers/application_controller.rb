class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :user_authorized

  private

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_authorized
    redirect_to :root unless session[:user_id]
  end

  def user_logged_in
    redirect_to projects_path if session[:user_id]
  end

end
