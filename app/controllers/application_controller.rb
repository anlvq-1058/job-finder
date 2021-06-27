class ApplicationController < ActionController::Base
  before_action :store_current_location, unless: :devise_controller?

  layout :base_layout

  def check_recruiter_permit
    return if current_user.recruiter?

    no_permit
  end

  def check_candidate_permit
    return if current_user.candidate?

    no_permit
  end

  def no_permit
    flash[:danger] = "You have no permit"
    redirect_to root_path
  end

  def base_layout
    return "application" if current_user.blank?
    current_user.recruiter? ? "application_admin" : "application"
  end

  def paginate jobs
    jobs.size % 10 >= 1 ? (jobs.size/10 + 1) : jobs.size/10
  end

  def store_current_location
    store_location_for(:user, request.url)
  end
end
