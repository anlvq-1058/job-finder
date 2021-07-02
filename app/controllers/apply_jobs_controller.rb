class ApplyJobsController < ApplicationController
  before_action :authenticate_user!, :check_candidate_permit, only: :create

  def create
    @errors = []
    job = Job.unexpired.active_status.find_by_id params[:id]
    resume = current_user.resumes.public_status.first
    @errors << "object not found" unless job
    @errors << "You don't have public resume" unless job
    JobResume.create(job_id: job.id, resume_id: resume.id) if @errors.blank?
    respond_to do |format|
      format.js
    end
  end
end
