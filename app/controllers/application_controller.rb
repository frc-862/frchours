class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_admin!
  before_filter :auth_admin!

protected

  def auth_admin!
    redirect_to welcome_index_path unless admin_signed_in?
  end
end
