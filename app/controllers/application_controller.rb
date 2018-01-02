class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :age, :address, { :subject_ids => [] }, :image, :salary])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :address, { :subject_ids => [] }, :image, :salary])
    devise_parameter_sanitizer.permit(:acount_update, keys: [:name, :age, :address, { :subject_ids => [] }, :image, :salary])
  end

end
