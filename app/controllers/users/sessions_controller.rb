class Users::SessionsController < Devise::SessionsController
  # prepend_before_action :check_captcha, only: [:create] 

  protected
  
  # def check_captcha
  #   unless verify_recaptcha
  #     self.resource = resource_class.new sign_in_params
  #     respond_with_navigational(resource) { render :new }
  #   end
  # end

  def after_sign_in_path_for user
    return root_url if current_user.user?
    return admin_root_url if current_user.admin?
  end
end
