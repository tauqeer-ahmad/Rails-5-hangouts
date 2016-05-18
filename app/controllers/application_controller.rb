class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_haunt!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :mark_alive
  before_action :set_online_haunts

  private

  def mark_alive
    current_haunt.try :touch
  end

  def set_online_haunts
    @appearances ||= Haunt.where("id != ?", current_haunt.try(:id))
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :surename, :password, :email, :avatar) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :email, :password, :current_password, :surname, :avatar) }
    end
end
