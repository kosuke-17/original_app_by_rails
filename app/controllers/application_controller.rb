class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name, :name_kana, :profile, :job_id, :user_image])
  end
end
