class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :add_nickname_avator, if: :devise_controller?

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def add_nickname_avator
    devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar)
  end

end
