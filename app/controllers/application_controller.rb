class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_registration_path, :notice => 'You must sign up or sign in to view this page'
    end
  end
  protected
  def after_sign_in_path_for(resource)
    dashboard_path
  end
  def after_sign_up_path_for(resource)
    dashboard_path
  end
end
