class ApplicationController < ActionController::Base
  layout :base_layout

  def base_layout
    return "application" if current_user.blank? 
    current_user.recruiter? ? "application_admin" : "application"
  end
end
