class Admin::SessionsController < Devise::SessionsController
  layout :sign_in_layout
  before_action :authenticate_user!, only: :new

  def new
    super
  end

  def destroy
    super
  end

  private

  helper_method :resource_name

  def sign_in_layout
    "sign_in"
  end

  def resource_name
    :user
  end

  def after_sign_out_path_for _resource_or_scope
    root_path
  end
end
