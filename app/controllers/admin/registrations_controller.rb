class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create
  before_action :configure_account_update_params, only: :update

  def edit
    super
  end

  def update
    super
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password,:password_confirmation,
        :remember_me, :avatar, :avatar_cache, :remove_avatar, :role, :birthday, :gender)
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:name, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar, :birthday, :gender)}
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
