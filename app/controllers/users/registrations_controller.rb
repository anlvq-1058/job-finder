class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create
  before_action :configure_update_params, only: :update

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar,
      :role, :birthday) }
  end

  def configure_update_params
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
  end
end
