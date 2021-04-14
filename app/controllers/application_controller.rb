class ApplicationController < ActionController::Base
  layout :base_layout


  def check_recruiter_permit
    return if current_user.recruiter?

    no_permit
  end

  def check_recruiter_permit
    return if current_user.candidate?

    no_permit
  end

  def no_permit
    flash[:danger] = "You have no permit"
    redirect_to root_path
  end

  # def base_layout
  #   return "application" if current_user.blank? 
  #   current_user.recruiter? ? "application_admin" : "application"
  # end

  def base_layout
    
    binding.pry
    
    if devise_controller? && devise_mapping.name == :admin_user && current_user.recruiter?
      "application_admin"
    else
      "application"
    end
  end
end
