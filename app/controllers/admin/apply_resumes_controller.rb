class Admin::ApplyResumesController < Admin::AdminController
  before_action :check_recruiter_view_resume, :load_apply_resume, only: %i(update destroy)

  def update
    @error = "error" unless @apply_resume.uncheck_status? && @apply_resume.approve_status!
    UserApplyMailer.approved(@apply_resume).deliver_now unless @error
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @error = "error" unless @apply_resume.uncheck_status? && @apply_resume.cancel_status!
    UserApplyMailer.cancel(@apply_resume).deliver_now unless @error
    respond_to do |format|
      format.js
    end
  end

  private 

  def load_apply_resume
    @apply_resume = JobResume.find params[:id]
    return if @apply_resume.resume

    @apply_resume
  end
end
