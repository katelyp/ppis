class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :authenticate_volunteer!
  before_action :configure_permitted_parameters, if: :devise_controller?
protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit([:name,:is_female,:date_of_birth,:mobile,:profession,
      :other_talents,:about_me])
  end
  
end

#devise_parameter_sanitizer.for(:sign_up) { |v| v.permit (:name, :is_female, :date_of_birth,
      #:mobile, :profession, :other_talents, :about_me)} 