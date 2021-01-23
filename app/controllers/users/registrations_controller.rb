class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: :create
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

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      respond_with_navigational(resource) { render :new }
    end
  end
end
