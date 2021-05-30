class Admin::AdminController < ApplicationController
  before_action :admin_required

  def check_recruiter_view_resume
    job_ids = JobResume.get_job_ids(params[:id]).pluck(:job_id).any?(current_user.company.jobs.ids)
    return if job_ids.present?

    flash[:danger] = "You can't view this resume"
  end

  private

  def admin_required
    return if current_user&.recruiter?

    flash[:danger] = "You don't have permit"
    redirect_to root_path
  end
end
