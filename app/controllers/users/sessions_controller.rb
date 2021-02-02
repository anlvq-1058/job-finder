class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create] 

  def create
    super
  end

  private
  
  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_in_params
      respond_with_navigational(resource) { render :new }
    end
  end
end